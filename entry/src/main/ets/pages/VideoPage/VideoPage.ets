import { common } from '../../common'
import { Comment, ReplyInput, Sidebar, VideoDescribe } from '../../components'
import { commentDataModel, DataSource as videoData, mediaType } from '../../models'
import { tiktokChatStory } from '../../utils'
import { util } from '@kit.ArkTS'


/**视频页*/
@Entry
@Component
export struct VideoPage {
  /**
   * 索引*/
  @Provide
  activeIndex: number = 0
  controller?: VideoController
  /**
   * 懒加载视频数据列表*/
  videoList = new videoData<mediaType>(this.getVideoData())

  getVideoData() {
    const data = common.getJSONFIleData('videos.json')
    return JSON.parse(data) as mediaType[]
  }

  build() {
    Swiper() {
      LazyForEach(this.videoList, (item: mediaType, index: number) => {
        playVideo({
          item,
          index,
          videoController: this.controller
        })
      })
    }
    .index($$this.activeIndex)
    //关闭指示器
    .indicator(false)
    .duration(200)
    .loop(false)
    //允许滚动
    .vertical(true)
  }
}

@Component
struct playVideo {
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
  videoController = new VideoController()
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

  aboutToAppear() {
    this.commentList = tiktokChatStory.getOneTiktokVideoAllComment(this.item.video.play_addr.uri)
  }

  //添加评论方法
  addComment(content: string) {
    const msg = new commentDataModel({
      id: Number(util.generateRandomUUID()),
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
      tiktokChatStory.delOneTiktokVideoComment(this.item.video.play_addr.uri, item.id)
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
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
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

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Video({
        src: this.item.video.play_addr.url_list[0],
        controller: this.videoController,
        currentProgressRate: this.videoSpeed
      })
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
        .width('100%')
        .height('100%')
        .autoPlay(this.index === this.activeIndex)
        .objectFit(ImageFit.Contain)//推荐使用压缩的方式
        .muted(this.activeIndex === this.index ? false : true)//轮到播放就取消静音
        .loop(true)
        .controls(false)//隐藏控制条
        .onAppear(() => {
          this.updateActiveIndex()
        })
      if (!this.playIng) {
        Column() {
          Image($r("app.media.Content_play")).width(68).height(68).opacity(.7)
        }
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
