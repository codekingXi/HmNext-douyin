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
    { title: '首页' },
    { title: '音乐' },
    {
      id: 3,
      title: '+',
    },
    { title: '朋友' },
    { title: '我' },
  ]
  @State
  currentIndex: number = 0

  @Builder
  Tabcontent(item: BarClass) {
    if (item.id === 3) {
      Text(item.title)
        .margin({
          top:10
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
            //待定
        })
    }
    Text(item.title).tabTsty()
  }

  build() {
    Tabs({ index: $$this.currentIndex }) {
      ForEach(this.tabList, (item: BarClass) => {
        TabContent() {

        }.tabIndex(this.currentIndex)
        .tabBar(this.Tabcontent(item))
      })

    }.barPosition(BarPosition.End)
    .height(50)

  }
}


export { TabBar }
