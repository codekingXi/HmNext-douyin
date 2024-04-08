import { TabBar } from '../components/TabBar'
import { TopNav } from '../components/TopNav'
import { videoPage } from '../components/video'
import { window } from '@kit.ArkUI'
import { sidebar } from '../components/sidebar'

@Entry
@Component
struct Index {
  //更改状态栏背景色
  async aboutToAppear(): Promise<void> {
    await window.getLastWindow(getContext())
      .then(win=>{
        win.setWindowBackgroundColor("#ff1c1b1b")
      })
  }
  build() {
    Stack() {
      //顶部导航栏
      TopNav()

      //视频组件
      videoPage()
        .position({
          y: '0%'
        })
        .layoutWeight(1)
        .zIndex(0)

      //侧边栏
      sidebar()
        .position({
          x:'85%',
          y:'50%'
        })
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

  }
}

