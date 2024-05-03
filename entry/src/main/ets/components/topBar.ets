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
    Column() {
      Text(item.title)
        .fontColor(Color.White)
        .fontWeight(600)
        .animation({
          duration: 300
        })
        .margin({
          bottom: 5
        })
      Divider()
        .strokeWidth(4)
        .color('#fffcfcfc')
        .lineCap(LineCapStyle.Round)
        .width(this.TopNavList[this.currentIndex].name===item.name? 23:0)
        .animation({
          duration: 200
        })
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
          }.height('100%')
          .tabBar()
        })

      }
      .animationDuration(200)
      .barWidth('40%')

      Row({space:20}){
        ForEach(this.TopNavList, (item: BarClass) => {
          this.titleCommon(item)
        })
      }.width('100%')
      .height(50).justifyContent(FlexAlign.Center)
      .position({y:'7.22%'})
      .backgroundColor(Color.Transparent)
    }

  }
}

export { TopBar }