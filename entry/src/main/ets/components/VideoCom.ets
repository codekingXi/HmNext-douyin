import { mediaInfo, mediaInfoModel } from '../models/mediaData'

@Component
struct videoPage {
  mediaList: mediaInfo[] = [
    {
      title: '草原',
      src: $rawfile('media/video.mp4'),
      id: 1,
    },
    {
      title: '复古',
      src: $rawfile('media/video2.mp4'),
      id: 2,
    },
    {
      title: '城市',
      src: $rawfile('media/video3.mp4'),
      id: 3,
    }
  ]
  @Provide
  activeIndex: number = 0

  build() {
    Swiper() {
      ForEach(this.mediaList, (item: mediaInfoModel, index: number | undefined) => {
        Playvideo({ item, index })
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
    .position({
      y: '0%'
    })
    .layoutWeight(1)
    .zIndex(0)
  }
}

export { videoPage }

@Component
struct Playvideo {
  item: mediaInfo = new mediaInfoModel({} as mediaInfo)
  index: number = -1
  @Consume
  @Watch('updateActiveIndex')
  activeIndex: number

  controller: VideoController = new VideoController()
  @State
  playIng:boolean = false

  //更新切换索引的状态
  updateActiveIndex() {
    if (this.activeIndex === this.index) {
      //播放
      this.controller.start()
      this.playIng=true
    } else {
      //暂停
      this.controller.pause()
      this.playIng=false
    }
  }

  build() {
    Stack({alignContent:Alignment.Center}) {
      Video({
        src: this.item.src,
        controller: this.controller
      })
        .onClick(()=>{
          if(this.playIng){
            this.controller.pause()
          }else{
            this.controller.start()
          }
          this.playIng=!this.playIng
        })
        .onAppear(() => {
          this.updateActiveIndex()
        })
        .muted(this.activeIndex === this.index ? false : true)
        .borderRadius({
          topLeft: 10,
          topRight: 10
        })
        .loop(true)//隐藏控制条
        .controls(false)
        .width('100%')
        .height('100%')
      Column(){
        if(this.playIng===false){
          Image($r("app.media.Content_play"))
            .width(68)
            .height(68)
            .opacity(.7)
        }
      }.justifyContent(FlexAlign.Center)
    }

  }
}
