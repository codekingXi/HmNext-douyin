import { TabBar } from '../components/TabBar'
import { TopNav } from '../components/TopNav'
import { videoPage } from '../components/video'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  async aboutToAppear(): Promise<void> {
    await window.getLastWindow(getContext())
      .then(win=>{
        win.setWindowBackgroundColor("#ff302f2f")
      })
  }
  build() {
    Stack() {
      TopNav()
      //视频组件
      videoPage()
        .position({
          y: '0%'
        })
        .layoutWeight(1)
        .zIndex(0)
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

