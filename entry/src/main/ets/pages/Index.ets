import { videoPage }from '../components/video'

@Entry
@Component
struct Index {

  build() {
    Column(){

      //视频组件
      videoPage()

    }
    .width('100%')
    .height('100%')
  }
}