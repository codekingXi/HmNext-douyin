import { BarClass } from '../models'
import Shop from '../pages/Shop/Shop'
import { VideoPage } from '../pages/VideoPage/VideoPage'
import { router, window } from '@kit.ArkUI'
import { COLOR_GRAY } from '../common/color/colors'


@Preview
@Component
struct TopBar {
  @State
  topTabList: BarClass[] = [
    {
      id: 0,
      title: "商场",
      name: "shop"
    },
    {
      id: 1,
      title: "推荐",
      name: "forYou"
    }
  ]
  @State
  titleColor: ResourceColor[] = [Color.White, Color.Black]
  tabController: TabsController = new TabsController()
  @State
  currentIndex: number = this.topTabList.length - 1
  @Consume
  IndexX: number | string
  @Consume
  showDialog: boolean
  @Consume
  bgColor: string
  @Provide
  titleWidth: number = 0

  @Builder
  titleCommon(item: BarClass) {
    Column() {
      Text(item.title)
        .fontColor(this.topTabList[this.currentIndex].id === 1 ? this.titleColor[0] : this.titleColor[1])
        .fontSize(22)
        .fontWeight(600)
        .margin({
          bottom: 5
        })
        .animation({
          duration: 50
        })
        .onAreaChange((oldArea, newArea) => {
          this.titleWidth = newArea.width as number
        })
    }
    .onClick(() => {
      //通过name找到索引
      const index = this.topTabList.findIndex(obj => obj.name === item.name)
      this.tabController.changeIndex(index) //切换索引值

    })
  }

  @State
  areaHei: number = 0

  async aboutToAppear(): Promise<void> {
    //窗口类方法必须用promise包裹
    const win = await window.getLastWindow(getContext())
    //获取顶部避让矩形区域的高度
    this.areaHei = px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      .topRect.height)
  }
  build() {
      Stack() {
        Tabs({ index: $$this.currentIndex, controller: this.tabController, barPosition: BarPosition.Start }) { //绑定当前索引
          ForEach(this.topTabList, (item: BarClass) => {
            TabContent() {
              if (item.id === 0) {
                Shop()
              } else if (item.id === 1) {
                VideoPage()
              }
            }
            .tabBar()
          })
        }
        .height('105%')
        .position({ y: '-4.8%' })
        .animationDuration(200)
        .barWidth('40%')

        //consTomBuiDer.builder(this.msg,24)
        //自定义样式覆盖原来的tabs
        Row({ space: 20 }) {
          //顶部nav的左方的按钮
          Row() {
            Image(this.topTabList[this.currentIndex].id === 1 ? $r("app.media.icon_index_nav") :
            $r("app.media.icon_bar_sideBtn"))
              .width(28).height(28)
              .onClick(() => {
                animateTo({
                  duration: 200
                }, () => {
                  this.showDialog = !this.showDialog
                  this.bgColor = '#80000000'
                  //更改坐标轴
                  this.IndexX = '70%'
                })

              })
          }.width(50).height(50).position({ x: '5%' })

          ForEach(this.topTabList, (item: BarClass) => {
            this.titleCommon(item)
          })
          Divider()
            .strokeWidth(4)
            .color('#fffcfcfc')
            .lineCap(LineCapStyle.Round)
            .width(25)
            .translate(this.topTabList[this.currentIndex].id === 0 ? { x: (this.titleWidth - 10) } :
              { x: this.titleWidth * 2 + 10 })
            .animation({
              duration: 300
            })
            .position({ x: 115, y: 40 })
          //顶部nav的右方的按钮
          Row() {
            Image(this.topTabList[this.currentIndex].id === 1 ? $r("app.media.icon_search") :
            $r("app.media.icon_meg_search"))
              .width(30).height(30)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/Search/SearchPage',
                  params: {
                    name: "搜你想看的"
                  }
                })
              })
          }.width(50).height(50).position({ x: '90%' })

        }.width('100%')
        .height(50).justifyContent(FlexAlign.Center)
        .position({ y: this.areaHei + 10 })
      }.position({ y: '-2.5%' })
  }
}

export { TopBar }
