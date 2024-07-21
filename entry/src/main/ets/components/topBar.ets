import { BarClass } from '../models'
import Shop from '../pages/Shop/Shop'
import { VideoPage } from '../pages/VideoPage/VideoPage'
import { router } from '@kit.ArkUI'
import { HeadBar } from '.'

/**
 * 顶部栏*/
@Component
export struct TopBar {
  async aboutToAppear(): Promise<void> {
    //重新赋值宽度
    AppStorage.set('BTN_TITLE_WIDTH', AppStorage.get('SCREEN_WIDTH') as number / this.topTabList.length)
  }

  /**
   * 顶部栏信息*/
  @State
  topTabList: BarClass[] = [
    {
      id: 0,
      title: "经验",
      name: "EXPERIMENT"
    },
    {
      id: 1,
      title: "热点",
      name: "HOTPOT"
    },
    {
      id: 2,
      title: "直播",
      name: "LIVE"
    },
    {
      id: 3,
      title: "精选",
      name: 'SELECTED'
    },
    {
      id: 4,
      title: "团购",
      name: "LOT OF BUY"
    },
    {
      id: 5,
      title: "上海",
      name: "AREA"
    },
    {
      id: 6,
      title: "关注",
      name: "CONCERN"
    },
    {
      id: 7,
      title: "商场",
      name: "SHOP"
    },
    {
      id: 8,
      title: "推荐",
      name: "FOR YOU"
    }
  ]
  @State
  titleColor: ResourceColor[] = [Color.White, Color.Black]
  tabController: TabsController = new TabsController()
  /**
   * 导航索引*/
  @State
  currentIndex: number = this.topTabList.length - 1 //必须设置为数组最后一位元素否
  @Consume
  IndexX: number | string
  @Consume
  showDialog: boolean
  @Consume
  bgColor: string

  @Builder
  titleCommon(item: BarClass) {
    Column({ space: 5 }) {
      Text(item.title)
        .textAlign(TextAlign.Center)
        .fontColor(this.topTabList[this.currentIndex].id === item.id ? '#ff00ceff' : '#ff5f5f5f')
        .fontWeight(600)
        .fontSize(20)
      Divider()
        .strokeWidth(3)
        .lineCap(LineCapStyle.Round)
        .width(this.topTabList[this.currentIndex].id === item.id ? 30 : 0)
        .color(this.topTabList[this.currentIndex].id === this.topTabList[this.topTabList.length-2].id ? Color.Black :
        Color.White)
    }

    .onClick(() => {
      //通过name找到索引
      const index = this.topTabList.findIndex(obj => obj.name === item.name)
      this.tabController.changeIndex(index) //切换索引值
    })
  }

  /**
   * 打开左侧边栏*/
  openLeftSideBar() {
    animateTo({ duration: 200 }, () => {
      this.showDialog = !this.showDialog
      this.bgColor = '#80000000'
      //更改坐标轴
      this.IndexX = '70%'
    })
  }

  /**
   * 进入搜索页*/
  clickSearch() {
    router.pushUrl({
      url: 'pages/Search/SearchPage',
      params: {
        name: "搜你想看的"
      }
    })
  }

  /**
   * 顶部栏主要内容总宽度*/
  BarMainContentWidth: number = AppStorage.get('SCREEN_WIDTH') as number - 100

  /**
   * 顶部栏主要内容*/
  @Builder
  barMainContent() {
    List({ space: 15, initialIndex: this.currentIndex }) {
      ForEach(this.topTabList, (item: BarClass) => {
        ListItem() {
          this.titleCommon(item)
        }
      })
    }
    .scrollBar(BarState.Off)
    .listDirection(Axis.Horizontal)
    .width(this.BarMainContentWidth)
    .height(50)
    .padding({ top: 15, left: 5, right: 5 })
  }

  @Styles
  Colum(){
    .width('100%')
    .height('100%').backgroundColor(Color.Gray)
  }

  build() {
    Stack() {
      Tabs({ index: $$this.currentIndex, controller: this.tabController, barPosition: BarPosition.Start }) { //绑定当前索引
        ForEach(this.topTabList, (item: BarClass) => {
          TabContent() {
            if (item.name === 'EXPERIMENT') {
              Column() {
                Text('敬请期待')
              }.Colum().justifyContent(FlexAlign.Center)

            } else if (item.name === 'HOTPOT') {
              Column() {
                Text('敬请期待')
              }.Colum().justifyContent(FlexAlign.Center)

            } else if (item.name === 'LIVE') {
              Column() {
                Text('敬请期待')
              }.Colum().justifyContent(FlexAlign.Center)
            } else if (item.name === 'SELECTED') {
              Column() {
                Text('敬请期待')
              }.Colum().justifyContent(FlexAlign.Center)
            } else if (item.name === 'LOT OF BUY') {
              Column() {
                Text('敬请期待')
              }.Colum().justifyContent(FlexAlign.Center)
            } else if (item.name === 'AREA') {
              Column() {
                Text('敬请期待')
              }.Colum().justifyContent(FlexAlign.Center)
            } else if (item.name === 'CONCERN') {
              Column() {
                Text('敬请期待')
              }.Colum().justifyContent(FlexAlign.Center)
            } else if (item.name === 'SHOP') {
              Shop()
            } else if (item.name === 'FOR YOU') {
              VideoPage()
            }
          }
          .tabBar()
        })
      }
      .height('106%')
      .position({ y: -(AppStorage.get('AREA_HEIGHT') as number) })
      .animationDuration(200)

      //自定义组件覆盖原来的tabs
      HeadBar({
        LeftIcon: $r('app.media.icon_LeftBar_white'),
        RightIcon: $r('app.media.icon_search'),
        LeftIconClick: () => {
          this.openLeftSideBar()
        },
        RightIconClick: () => {
          this.clickSearch()
        },
        BarMainContent: () => {
          this.barMainContent()
        }
      })
        .position({ y: AppStorage.get('AREA_HEIGHT') as number + 10 })
    }.position({ y: '-2.5%' })
  }
}
