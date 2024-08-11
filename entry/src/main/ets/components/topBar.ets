import { BarClass, DataSource } from '../models'
import Shop from '../pages/Shop/Shop'
import { VideoPage } from '../pages/VideoPage/VideoPage'
import { router } from '@kit.ArkUI'
import { HeadBar } from '.'
import { ListIndexPosition } from '../models/Type'

/**
 * 顶部栏*/
@Component
export struct TopBar {
  aboutToAppear(): void {
    //重新赋值宽度
    AppStorage.set('Btn_title_width', AppStorage.get('Screen_width') as number / this.topTabList.length)
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
  tabController: TabsController = new TabsController()
  @Consume
  IndexX: number | string
  @Consume
  showDialog: boolean
  @Consume
  bgColor: string

  @Builder
  titleCommon(item: BarClass, index: number) {
    Column({ space: 5 }) {
      Text(item.title)
        .textAlign(TextAlign.Center)
        .fontColor(this.currentIndex === index ? '#ff00ceff' : '#ff5f5f5f')
        .fontWeight(600)
        .fontSize(20)
      Divider()
        .strokeWidth(3)
        .lineCap(LineCapStyle.Butt)
        .width(this.currentIndex === index ? 30 : 0)
        .color(this.topTabList[this.currentIndex].name === 'SHOP' ? Color.Black :
        Color.White)
    }

    .onClick(() => {
      //通过name找到索引
      const index = this.topTabList.findIndex(obj => obj.id === item.id)
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
   * 顶部列表项数据*/
  private tabListData = new DataSource(this.topTabList)
  /**
   * 顶部栏主要内容总宽度*/
  BarMainContentWidth: number = AppStorage.get('Screen_width') as number - 100

  /**
   * 顶部列表滚动控制器*/
  private classifyScroller: Scroller = new Scroller() //
  /**
   * 顶部栏列表可视区域的起始索引和终点索引*/
  tagIndexPosition: ListIndexPosition = { start: 0, end: 0 } // 一级列表可视区域的起始索引和终点索引
  /**
   * 顶部导航栏焦点索引值 当前索引
   * */
  @State
  @Watch('onIndexChange')
  currentIndex: number = this.topTabList.length - 1

  /**
   * 当索引发生变化时调用此方法，用于调整分类滚动视图的显示位置
   * 该方法通过比较当前索引和预设的起始、结束位置，决定滚动的方向和目标索引
   */
  onIndexChange() {
    // 获取当前标签索引位置的起始和结束值
    const start = this.tagIndexPosition.start;
    const end = this.tagIndexPosition.end;

    // 当前索引接近结束位置时，向左滚动
    if (this.currentIndex === end || this.currentIndex === end - 1) {
      // 计算需要滚动到的左侧目标索引
      let leftScrollCount: number = this.currentIndex + 2;
      // 确保目标索引不会超出数组范围
      leftScrollCount = leftScrollCount >= this.topTabList.length - 1 ? this.topTabList.length - 1 : leftScrollCount;
      // 执行滚动操作
      this.classifyScroller.scrollToIndex(leftScrollCount, true); // 使获焦item向左滚动
    }

    // 当前索引接近起始位置时，向右滚动
    if (this.currentIndex === start || this.currentIndex === start + 1) {
      // 计算需要滚动到的右侧目标索引
      let rightScrollCount: number = this.currentIndex - 1;
      // 确保目标索引不会超出数组范围
      rightScrollCount = rightScrollCount <= 0 ? 0 : rightScrollCount;
      // 执行滚动操作
      this.classifyScroller.scrollToIndex(rightScrollCount, true); // 使获焦item向右滚动
    }
  }

  /**
   * 顶部栏主要内容*/
  @Builder
  barMainContent() {
    List({ space: 15, initialIndex: this.currentIndex, scroller: this.classifyScroller }) {
      LazyForEach(this.tabListData, (item: BarClass, index: number) => {
        ListItem() {
          this.titleCommon(item, index)
        }
      })
    }
    .onScrollIndex((start: number, end: number) => {
      this.tagIndexPosition = { start, end }
    })
    .edgeEffect(EdgeEffect.None)
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
      Tabs({ index: $$this.currentIndex, controller: this.tabController, barPosition: BarPosition.Start }) {
        ForEach(this.topTabList, (item: BarClass) => {
          TabContent() {
            if (item.name === 'EXPERIMENT') {
              Column() {
                Text('敬请期待')
              }
            } else if (item.name === 'HOTPOT') {
              VideoPage()
            } else if (item.name === 'LIVE') {
              Column() {
                Text('敬请期待')
              }
            } else if (item.name === 'SELECTED') {
              Column() {
                Text('敬请期待')
              }
            } else if (item.name === 'LOT OF BUY') {
              Shop()
            } else if (item.name === 'AREA') {
              VideoPage()
            } else if (item.name === 'CONCERN') {
              VideoPage()
            } else if (item.name === 'SHOP') {
              Shop()
            } else if (item.name === 'FOR YOU') {
              VideoPage()
            }
          }
        })
      }
      .height('106%')
      .position({ y: -(AppStorage.get('Area_height') as number) })
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
        .position({ y: AppStorage.get('Area_height') as number + 10 })
    }.position({ y: '-2.5%' })
  }
}