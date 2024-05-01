import { bottomNav } from '../components/bottomNav'
import { window } from '@kit.ArkUI'
import { ContentArea } from '../components/ContentArea'

@Entry
@Component
struct Index {

  async aboutToAppear(): Promise<void> {
    await window.getLastWindow(getContext())
      .then(win=>{
        win.setWindowBackgroundColor("#ff1c1b1b")
      })
  }
  build() {
    Stack() {
      // 内容区域
      ContentArea()
      //导航栏 底部
      bottomNav()

    }

    .width('100%')
    .height('100%')

  }
}
