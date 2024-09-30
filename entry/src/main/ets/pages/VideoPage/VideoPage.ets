import { VideoCtl } from '../../common'
import { Comment, ReplyInput, Sidebar } from '../../components'
import { commentDataModel, DataSource as videoData, mediaInfo, mediaList } from '../../models'

import video from '../../common/data/videos.json'

/**视频页*/
@Entry
@Component
export struct VideoPage {
  /**
   * 索引*/
  @State
  activeIndex: number = 0
  /**
   * 懒加载视频数据列表*/
  videoList = new videoData(video)

  build() {
    Swiper() {
      LazyForEach(this.videoList, (item: string, index: number) => {
        playVideo({ index, activeIndex: this.activeIndex })
      })
      // ForEach(mediaList, (item: mediaInfo, index: number) => {
      //   playVideo({ item, index })
      // })
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
  @Prop
  index: number = -1 //默认值给负数 防止对不上数据
  @Prop
  item: mediaInfo
  /**
   * 播放的索引*/
  @Prop
  @Watch('updateActiveIndex')
  activeIndex: number
  /**
   * 视频播放状态*/
  @State
  playIng: boolean = false
  @Consume
  isShowSpeed: boolean
  @State
  videoSpeed: number = 1 //视频倍速
  @Provide
  showCommentDialog: boolean = false

  startVideo() {
    VideoCtl.start()
    this.playIng = true
  }

  pauseVideo() {
    VideoCtl.pause()
    this.playIng = false
  }

  /**
   * 更新切换索引的状态*/
  updateActiveIndex() {
    if (this.activeIndex === this.index) {
      this.startVideo()
    } else {
      this.pauseVideo()
    }
  }

  startSpeed() {
    this.isShowSpeed = true
    this.videoSpeed = 2
  }

  closeSpeed() {
    this.isShowSpeed = false
    this.videoSpeed = 1
  }

  //评论的数据
  @State commentList: commentDataModel[] = [
    new commentDataModel({
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34,
      likeFlag: false
    }),
    new commentDataModel({
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58,
      likeFlag: false
    }),
    new commentDataModel({
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10,
      likeFlag: false
    }),
    new commentDataModel({
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139,
      likeFlag: false
    }),
    new commentDataModel({
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29,
      likeFlag: false
    }),
    new commentDataModel({
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100,
      likeFlag: false
    })
  ]

  //添加评论方法
  addComment(content: string) {
    this.commentList.unshift(new commentDataModel({
      id: Math.random(),
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: 'smallMiSu7',
      content,
      time: `0${(new Date().getMonth() + 1).toString().padStart(2, '')}-${(new Date().getDate()
        .toString()
        .padStart(2, '0'))}`,
      area: '上海',
      likeNum: 34,
      likeFlag: false
    }))
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
        ForEach(this.commentList, (item: commentDataModel) => {
          ListItem() {
            Comment({ item: item })
          }
        })
      }.layoutWeight(1)
      .scrollBar(BarState.Off)

      //评论组件
      ReplyInput({
        publishComment: (content: string) => {
          this.addComment(content)
        },
        iptContent: '善语结善缘,恶言伤人心'
      }).margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  build() {
    Stack() {
      Video({
        src: `${video[this.index].video.play_addr.url_list}`,
        controller: VideoCtl,
        currentProgressRate: this.videoSpeed
      })//半模态弹层
        .bindSheet($$this.showCommentDialog, this.Dialog, {
          height: '65%',
          backgroundColor: '#ffefecec'
        })// 手势
        .gesture(GestureGroup(GestureMode.Parallel,
          LongPressGesture()
            .onAction(() => {
              this.startSpeed()
            })
            .onActionEnd(() => {
              this.closeSpeed()
            })
        ))
        .width('100%')
        .height('100%')
        .autoPlay(this.activeIndex === this.index ? true : false)
        .objectFit(ImageFit.Contain)//推荐使用压缩的方式
        .muted(this.activeIndex === this.index ? false : true)//轮到播放就取静音
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

      //侧边功能区组件
      Sidebar()
    }.onClick(() => {
      //点击控制播放和暂停
      if (this.playIng) { //默认在播放
        this.pauseVideo()
      } else {
        this.startVideo()
      }
    })
  }
}
