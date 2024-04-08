import { TabBar } from '../components/TabBar'
import { videoPage } from '../components/video'

@Entry
@Component
struct Index {
  // @State
  // vdHei: number = 0
  build() {
    Stack() {

      //视频组件
      videoPage()
        .position({
          y: '0%'
        })
        .layoutWeight(1)
        .zIndex(1)
      //导航栏 底部
      TabBar()
        .backgroundColor('#ff373636')
        .layoutWeight(1)
        .zIndex(2)
        .position({
          y:'97.5%'
        })
    }
    .width('100%')
    .height('100%')

    //获取屏幕区域高度
    // .onAreaChange((oldArea,newArea) => {
    //   this.vdHei = (newArea.height as number) - 50
    // })
  }
}

