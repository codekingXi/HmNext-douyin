import { Sidebar } from '../../components'
import { mediaInfo, mediaInfoModel } from '../../models'
import { mediaList } from '../../models/mediaData'

/**视频页*/
@Entry
@Component
struct VideoPage {

  @Provide
  activeIndex: number = 0


  build() {
    Swiper() {
      ForEach(mediaList, (item: mediaInfoModel, index: number) => {
        playVideo({ item, index })
      })
    }
    .index($$this.activeIndex)
    //关闭滚动条
    .indicator(false)
    .duration(200)
    //允许循环
    .loop(true)
    //允许滚动
    .vertical(true)
  }
}

@Component
struct playVideo {
  item: mediaInfo = new mediaInfoModel({} as mediaInfo)
  index: number = -1
  @Consume
  @Watch('updateActiveIndex')
  activeIndex: number
  controller: VideoController = new VideoController()
  @State
  playIng: boolean = false

  //播放
  playVd() {
    this.controller.start()
    this.playIng = true
  }

  //暂停
  pauseVd() {
    this.controller.pause()
    this.playIng = false
  }

  //更新切换索引的状态
  updateActiveIndex() {
    if (this.activeIndex === this.index) {
      this.playVd()
    } else {
      this.pauseVd()
    }
  }

  @Consume
  titleWidth: number

  build() {
    Stack() {
      Video({
        src: this.item.src,
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
        .objectFit(ImageFit.Cover)
        .onClick(() => {
          if (this.playIng) {
            this.controller.pause()
          } else {
            this.controller.start()
          }
          this.playIng = !this.playIng
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

      Sidebar().zIndex(2)
        .position({ x: '85%', y: '50%' })
    }
  }
}

export { VideoPage }