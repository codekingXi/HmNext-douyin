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
  topTabList: BarClass[] = [
    {
      title: "商场",
      name: "shop"
    },
    {
      title: "推荐",
      name: "forYou"
    }
  ]

  tabController:TabsController = new TabsController()
  @State
  currentIndex: number = this.topTabList.length-1

  @Builder
  titleCommon(item: BarClass) {
    Column() {
      Text(item.title)
        .fontColor(Color.White)
        .T()
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
        .width(this.topTabList[this.currentIndex].name===item.name? 23:0)
        .animation({
          duration: 200
        })
    }
    .onClick(()=>{
      //通过name找到索引
      const index = this.topTabList.findIndex(obj=>obj.name===item.name)
      this.tabController.changeIndex(index) //切换索引值
    })
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Tabs({ index: $$this.currentIndex,controller:this.tabController, barPosition: BarPosition.Start }) { //绑定当前索引
        ForEach(this.topTabList, (item: BarClass) => {
          TabContent() {
            if (item.name === "shop") {
              Text('Shop')
            }
            else if (item.name === "forYou") {
              VideoPage()
            }
          }
          .tabBar()
        })

      }
      .animationDuration(200)
      .barWidth('40%')

      Row({space:20}){
        ForEach(this.topTabList, (item: BarClass) => {
          this.titleCommon(item)
        })
      }.width('100%')
      .height(50).justifyContent(FlexAlign.Center)
      .position({y:'7.22%'})
    }.position({y:'-2.5%'})

  }
}

export { TopBar }