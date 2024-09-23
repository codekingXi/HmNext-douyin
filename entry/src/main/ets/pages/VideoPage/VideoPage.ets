import { VideoCtl } from '../../common'
import { Sidebar } from '../../components'
import { DataSource as videoData, mediaInfo, mediaList } from '../../models'

import video from '../../common/data/videos.json'

/**视频页*/
@Entry
@Component
export struct VideoPage {
  /**
   * 索引*/
  @Provide
  activeIndex: number = 0

  /**
   * 懒加载视频数据列表*/
  videoList = new videoData(video)

  build() {
    Swiper() {
      LazyForEach(this.videoList, (item: string, index: number) => {
        playVideo({ index })
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
  index: number = -1 //默认值给负数 防止对不上数据
  @Prop
  item: mediaInfo
  /**
   * 播放的索引*/
  @Consume
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

  build() {
    Stack() {
      Video({
        src:`${video[this.index].video.play_addr.url_list}`,
        controller: VideoCtl,
        currentProgressRate: this.videoSpeed
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
        .autoPlay(this.index === 0)
        .objectFit(ImageFit.Contain)//推荐使用压缩的方式
        .muted(this.activeIndex === this.index ? false : true)
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
