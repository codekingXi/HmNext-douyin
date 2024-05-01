import { BarClass } from '../models'
import { videoPage } from './VideoCom'
import { promptAction } from '@kit.ArkUI'

@Extend(Text)
function T() {
  .fontColor(Color.White)
  .fontSize(24)
}

@Preview
@Component
struct TopNav {
  @State
  TopNavList: BarClass[] = [
    {
      id: 0,
      title: "推荐",
      name: "forYou"
    }, {
    id: 1,
    title: "商场",
    name: "shop"
    }
  ]
  aboutToAppear(): void {
    this.updateIndex()
  }
  @State
  @Watch("updateIndex")
  currentIndex: number = 0

  updateIndex() {

  }

  @Builder
  Common(item: BarClass) {
    Row() {
      Text(item.title).T()
    }
  }

  build() {
    Column() {
      Tabs({ index: $$this.currentIndex }) { //绑定当前索引
        ForEach(this.TopNavList, (item: BarClass) => {
          TabContent() {
            if (item.name === "shop") {

            } else
              if (item.name === "forYou") {
                videoPage()
              }
          }
          .tabBar(this.Common(item))
        })
      }.barWidth('40%')
    }

  }
}

export { TopNav }