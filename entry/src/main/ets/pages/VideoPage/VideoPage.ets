import { Sidebar } from '../../components'
import { DataSource as videoData } from '../../models'
import video from '../../common/data/videos.json'

/**视频页*/
@Entry
@Component
struct VideoPage {
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
  index: number = -1 //默认值只能是-1
  /**
   * 播放的索引*/
  @Prop
  @Watch('updateActiveIndex')
  activeIndex: number
  /**
   * 视频控制器*/
  controller: VideoController = new VideoController()
  /**
   * 视频播放状态*/
  @State
  playIng: boolean = false

  /**
   * 播放*/
  playVd() {
    this.controller.start()
    this.playIng = true
  }

  /**
   * 暂停*/
  pauseVd() {
    this.controller.pause()
    this.playIng = false
  }

  /**
   * 更新切换索引的状态*/
  updateActiveIndex() {
    if (this.activeIndex === this.index) {
      this.playVd()
    } else {
      this.pauseVd()
    }
  }

  build() {
    Stack() {
      Video({
        src: `${video[this.index].video.play_addr.url_list}`,
        controller: this.controller
      })// 手势
        // .gesture(
        //   PanGesture({
        //     direction:PanDirection.Horizontal,
        //     distance:1
        //   })
        //     .onActionUpdate((e:GestureEvent)=>{
        //       if(e){
        //         //this.titleWidth = e.offsetX
        //       }
        //     })
        // )
        .autoPlay(true)
        .objectFit(ImageFit.Contain)//推荐使用压缩的方式
        .onClick(() => {
          if (this.playIng) {
            this.controller.pause()
          } else {
            this.controller.start()
          }
          this.playIng = !this.playIng //修改状态 取反
        })
        .onAppear(() => {
          this.updateActiveIndex()
        })
        .muted(this.activeIndex === this.index ? false : true)
        .loop(true)
        .controls(false)//隐藏控制条
        .width('100%')
        .height('100%')
      Column() {
        if (!this.playIng) {
          Image($r("app.media.Content_play"))
            .width(68)
            .height(68)
            .opacity(.7)
        }
      }.justifyContent(FlexAlign.Center)

      Sidebar()
    }
  }
}

export { VideoPage }