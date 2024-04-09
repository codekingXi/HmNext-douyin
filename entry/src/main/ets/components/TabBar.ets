import { BarClass } from '../models/barData'
import { promptAction } from '@kit.ArkUI'

@Extend(Text)
function tabTsty() {
  .fontColor(Color.White)
  .fontSize(24)
  .lineHeight(50)
}

@Component
struct TabBar {
  @State
  tabList: BarClass[] = [
    {
      id: 1,
      title: '首页',
      click: () => {}
    },
    {
      id: 2,
      title: '朋友',
      click: () => {}
    },
    {
      id: 3,
      title: '+',
      click: () => {}
    },
    {
      id: 4,
      title: '信息',
      click: () => {}
    },
    {
      id: 5, title: '我',
      click: () => {}
    },
  ]
  @State
  currentIndex: number = 0

  @Builder
  Tabcontent(item: BarClass) {
    if (item.id === 3) {
      Text(item.title)
        .margin({
          top: 10
        })
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .width(40)
        .aspectRatio(1)
        .fontSize(26)
        .border({
          width: 3,
          color: '#fffaf9f9'
        })
        .borderRadius(8)
        .onClick(() => {
          item.click&&item.click()
        })
    }
    Text(item.title).tabTsty()
  }

  build() {
    Tabs({ index: $$this.currentIndex }) {
      ForEach(this.tabList, (item: BarClass) => {
        TabContent() {

        }
        .tabBar(this.Tabcontent(item))
      })

    }
    .barPosition(BarPosition.End)
    .height(50)
    .backgroundColor('#ff373636')
    .layoutWeight(1)
    .zIndex(2)
    .position({
      y: '97.5%'
    })
  }
}


export { TabBar }
