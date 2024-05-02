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
      title: "推荐",
      name: "forYou"
    }, {
    title: "商场",
    name: "shop"
  }
  ]

  // async aboutToAppear(): Promise<void> {
  //
  //   this.updateIndex()
  // }

  @State
  @Watch("updateIndex")
  currentIndex: number = 0

  updateIndex() {

  }

  @Builder
  titleCommon(item: BarClass) {
    Row() {
      Text(item.title).T()
    }
  }

  build() {
    Stack({alignContent:Alignment.Top}){
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