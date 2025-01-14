import { commentDataModel, mediaType } from "../models"
import { util } from "@kit.ArkTS"
import { tiktokChatStory } from "../utils"
import { Comment, ReplyInput, Sidebar, VideoDescribe } from "."
import { common } from "../common"

@Reusable
@Component
export struct VideoComp {
  /**
   * 接收传入的视频索引*/
  @Require
  @Prop
  index: number = -1
  /**
   * 视频项*/
  @Require
  @Prop
  item: mediaType
  /**
   * 播放的索引*/
  @Consume
  @Watch('updateActiveIndex')
  activeIndex: number
  /**
   * 视频播放状态*/
  @State
  playIng: boolean = true
  @Consume
  isShowSpeed: boolean
  @State
  videoSpeed: number = 1 //视频倍速
  @Provide
  showCommentDialog: boolean = false
  //基础版视频播控器
  videoController = new VideoController() || common.globalVideoController
  //评论的数据
  @State commentList: commentDataModel[] = []
  @Consume speedColor: string
  @Consume speedSize: number
  @Consume isShowNav: boolean
  @Consume showDialog: boolean

  /**
   * 更新切换索引的状态*/
  updateActiveIndex() {
    this.activeIndex === this.index ? this.startVideo() : this.stopVideo()
  }

  startVideo() {
    this.videoController.start()
  }

  pauseVideo() {
    this.videoController.pause()
  }

  stopVideo() {
    this.videoController.stop()
  }

  startSpeed() {
    this.isShowSpeed = true
    this.videoSpeed = 2
  }

  closeSpeed() {
    this.isShowSpeed = false
    this.videoSpeed = 1
  }

  //添加评论方法
  addComment(content: string) {
    const msg = new commentDataModel({
      id: util.generateRandomUUID(),
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: 'smallMiSu7',
      content,
      time: `${(new Date().getMonth() + 1).toString().padStart(2, '')}-${(new Date().getDate()
        .toString()
        .padStart(2, '0'))}`,
      area: common.getRandomCity(),
      likeNum: Math.floor(Math.random() * 9999999 + 1),
      likeFlag: false
    })
    //写到ui
    this.commentList.unshift(msg)
    //写入首选项
    tiktokChatStory.addOneTiktokVideoComment(this.item.video.play_addr.uri, msg)
  }

  @Builder
  endMegItem(item: commentDataModel, index: number) {
    Row() {
      Text('删除')
        .width('100%').textAlign(TextAlign.Center)
    }.backgroundColor(Color.Red)
    .width('100')
    .height('100%')
    .onClick(() => {
      this.commentList.splice(index, 1)
      tiktokChatStory.delOneTiktokVideoComment(this.item.video.play_addr.uri, item.id as number)
    })
  }

  @Builder
  Dialog() {
    Column() {
      Row() {
        Text(`${this.commentList.length}条评论`)
          .fontColor(Color.Black)
          .fontSize(16)
      }.margin({
        top: 50
      })

      List({ space: 20 }) {
        ForEach(this.commentList, (item: commentDataModel, index: number) => {
          ListItem() {
            Comment({ item: item, videoItem: this.item })
          }
          .swipeAction({
            end: this.endMegItem(item, index)
          })
        })
      }.layoutWeight(1)
      .scrollBar(BarState.Off)

      //评论组件
      ReplyInput({
        publishComment: (content: string) => {
          this.addComment(content)
        },
        iptContent: '善语结善缘,恶言伤人心',
      }).border({
        width: {
          top: .5
        },
        color: Color.Gray
      })
    }
  }

  startSpeedAnimation() {
    animateTo({ duration: 500, iterations: -1 }, () => {
      this.speedColor = '#ff98fd25'
      this.speedSize = 40
    })
  }

  stopSpeedAnimation() {
    animateTo({ duration: 500, iterations: -1 }, () => {
      this.speedColor = '#ff4e4e4e'
      this.speedSize = 30
    })
  }

  aboutToAppear() {
    //获取评论数据
    this.commentList = tiktokChatStory.getOneTiktokVideoAllComment(this.item.video.play_addr.uri)
  }

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Video({
        src: this.item.video.play_addr.url_list[0],
        controller: this.videoController,
        currentProgressRate: this.videoSpeed
      })
        .autoPlay(this.activeIndex === this.index)
        .loop(true)
        .objectFit(ImageFit.Contain)
        .controls(false)
        .onStart(() => {
          this.playIng = true
        })
        .onPause(() => {
          this.playIng = false
        })
        .bindSheet($$this.showCommentDialog, this.Dialog, {
          height: '65%',
          backgroundColor: '#ffefecec',
          keyboardAvoidMode: SheetKeyboardAvoidMode.RESIZE_ONLY,
          shouldDismiss: () => {
            this.showCommentDialog = false
            this.isShowNav = !this.isShowNav
            this.showDialog = !this.showDialog
          }
        })
        .gesture(GestureGroup(GestureMode.Parallel,
          LongPressGesture()
            .onAction(() => {
              this.startSpeed()
              this.startSpeedAnimation()
            })
            .onActionEnd(() => {
              this.closeSpeed()
              this.stopSpeedAnimation()
            })
        ))
      if (!this.playIng) {
        Column() {
          Image($r("app.media.Content_play")).width(68).height(68).opacity(.7)
        }
        .height('100%').width('100%')
        .justifyContent(FlexAlign.Center)
      }
      //视频描述
      VideoDescribe({
        title: this.item.music.author,
        describe: this.item.desc
      })
      //侧边功能区组件
      if (this.isShowNav) {
        Sidebar({
          item: this.item
        })
      }
    }.onClick(() => {
      //点击控制播放和暂停 默认在播放
      this.playIng ? this.pauseVideo() : this.startVideo()
    })
  }
}