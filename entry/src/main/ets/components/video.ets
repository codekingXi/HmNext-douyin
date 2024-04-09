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
  activeIndex:number=0

  build() {
      Swiper() {
        ForEach(this.mediaList, (item: mediaInfoModel,index:number) => {
          Playvideo({item,index})
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
  item: mediaInfo=new mediaInfoModel({} as mediaInfo)
  index:number=-1
  @Consume
  @Watch('updateActiveIndex')
  activeIndex: number
  controller:VideoController=new VideoController()
  //初始化就加载程序
  aboutToAppear(): void {

  }
  //更新切换索引的状态
  updateActiveIndex(){
    if(this.activeIndex===this.index){
      //播放
      this.controller.start()

    }else{
      //暂停
      this.controller.pause()
    }
  }

  build() {
    Video({
      src: this.item.src,
      controller:this.controller,

    })
      .onAppear(() => {
        this.updateActiveIndex()
      })
      .muted(this.activeIndex===this.index?false:true)
      .autoPlay(true)
      .borderRadius({
        topLeft:10,
        topRight:10
      })
      .loop(true)
        //隐藏控制条
      .controls(false)
      .width('100%')
  }
}
