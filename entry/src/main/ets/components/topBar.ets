import { window } from '@kit.ArkUI'
import { Sidebar } from '.'
import { BarClass } from '../models'
import { VideoPage } from '../pages/VideoPage/VideoPage'

@Extend(Text)
function T() {
  .fontColor(Color.White)
  .fontSize(24)
}

@Component
struct TopBar {
  @State
  TopNavList: BarClass[] = [
    {
      title: "商场",
      name: "shop"
    },
    {
      title: "推荐",
      name: "forYou"
    }
  ]

  @State
  currentIndex: number = this.TopNavList.length-1

  @Builder
  titleCommon(item: BarClass) {
    Row() {
      Text(item.title).T()
    }
  }


  build() {
    Stack({ alignContent: Alignment.Top }) {
      Tabs({ index: $$this.currentIndex, barPosition: BarPosition.Start }) { //绑定当前索引
        ForEach(this.TopNavList, (item: BarClass) => {
          TabContent() {
            if (item.name === "shop") {
              Text('Shop')
            }
            else if (item.name === "forYou") {
              VideoPage()
            }
          }.layoutWeight(1)
          .tabBar(this.titleCommon(item))

        })
      }

      .barWidth('40%')
    }

  }
}

export { TopBar }