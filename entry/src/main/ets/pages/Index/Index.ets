import { BarClass } from '../../models'
import My from '../My/My'
import { TopBar } from '../../components'
import { window } from '@kit.ArkUI'

@Extend(Text)
function tabSty() {
  .fontColor(Color.White)
  .fontSize(24)

}

@Entry
@Component
struct Index {
  @State
  tabList: BarClass[] = [
    {
      title: '首页',
      name: "Home"
    },
    {
      title: '朋友',
      name: "Friend",
    },
    {
      title: '信息',
      name: "Message",
    },
    {
      title: '我',
      name: "My",
    }
  ]

  @Builder
  bottomBar(item: BarClass) {
    Row() {
      Text(item.title).tabSty()
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.Black)
  }

  @State
  currentIndex: number = 0

 async aboutToAppear(): Promise<void> {
     await window.getLastWindow(getContext())
      .then(win => {
        win.setWindowLayoutFullScreen(true)
        win.setWindowBackgroundColor('#ff2f2e2e')
      })
  }

  build() {
    Column() {

      Tabs({ index: $$this.currentIndex, barPosition: BarPosition.End }) {
        ForEach(this.tabList, (item: BarClass) => {
          TabContent() {
            if (item.name === "Home") {
              TopBar().margin({
                top:50
              })
            } else if (item.name === "Friend") {

            }
            else if (item.name === "Message") {

            }
            else if (item.name === "My") {
              My()
            }
          }.tabBar(this.bottomBar(item))
        })
      }.barPosition(BarPosition.End)
      .zIndex(1)
      .backgroundColor(Color.Black)

    }
  }
}


