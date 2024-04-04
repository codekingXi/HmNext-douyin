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

  build() {
    Swiper() {
      ForEach(this.mediaList, (item: mediaInfoModel) => {
        this.Playvideo(item)
      })
    }
    //关闭滚动条
    .indicator(false)
    .duration(200)
    .loop(true)
    .vertical(true)
  }

  @Builder
  Playvideo(item: mediaInfoModel) {
    Video({
      src: item.src
    })
      .autoPlay(true)
      .loop(true)
      //隐藏控制条
      .controls(false)
      .width('100%')
  }
}

export { videoPage }