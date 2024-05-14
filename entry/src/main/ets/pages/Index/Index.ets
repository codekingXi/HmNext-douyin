import { BarClass } from '../../models'
import { SideBarCom, TopBar } from '../../components'
import { promptAction, window } from '@kit.ArkUI'
import My from '../My/My'
import customDialog from '../../components/customDialog'

@Extend(Text)
function tabSty() {
  .fontColor(Color.White)
  .fontSize(24)
}

@Entry
@Component
struct Index {
  @State
  btmTabList: BarClass[] = [// 底部tab栏数据
    {
      title: '首页',
      name: "Home",
    },
    {
      title: '朋友',
      name: "Friend",
    },
    {
      title: '信息',
      name: "Message",
    },
    {
      title: '我',
      name: "My",
    }
  ]
  tabController: TabsController = new TabsController()
  @Provide
  IndexX: number | string = '' //整个index页面的x坐标
  @State
  currentIndex: number = 0
  @State
  showDialog: boolean = false
  @State
  sidePosition: boolean = false
  @State
  itemData: BarClass[] = [
    {
      icon: $r('app.media.icon_shopCar'),
      title: "我的订单",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_wallet'),
      title: "我的钱包",
      rightContent: '8.88',
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      }

    },
    {
      icon: $r('app.media.icon_QRcode'),
      title: "我的二维码",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true

    },
    {
      icon: $r('app.media.icon_time'),
      title: "观看历史",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true

    },
    {
      icon: $r('app.media.icon_waitplay'),
      title: "稍后再看",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true

    },
    {
      icon: $r('app.media.icon_clouddownload'),
      title: "离线模式",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_idea'),
      title: "抖音创作着中心",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      }
    },
    {
      icon: $r('app.media.icon_applet'),
      title: "小程序",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_love'),
      title: "抖音公益",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_sapling'),
      title: "青少年模式",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_service'),
      title: "我的客服",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_setting'),
      title: "设置",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      }
    },
    {
      icon: $r('app.media.icon_personedetail'),
      title: "个人信息收集清单",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_share'),
      title: "第三方信息共享清单",
      click: () => {
        promptAction.showToast({ message: "功能未完善" })
      },
      bottomBorder: true
    }
  ]

  @State
  preview: CustomDialogController = new CustomDialogController({
    builder: customDialog(),
    customStyle: true
  })

  @Builder
  contentItem(item: BarClass) {

    Row() {
      Row({ space: 10 }) {
        Image(item.icon).width(20).height(20)
        Text(item.title).fontSize(16)
      }

      if (item.rightContent) {
        Row() {
          Text('￥' + item.rightContent).textAlign(TextAlign.Center)
            .fontSize(16)
            .fontColor('#ff515151')

        }
        .width(60)
        .height(30)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('rgba(227, 227, 227, 0.50)')
        .borderRadius(40)
      }
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .onClick(() => {
      item.click && item.click()
    })
    .border({
      width: {
        bottom: item.bottomBorder === true ? 0 : 0.5
      }
    })
  }

  @Builder
  bottomBar(item: BarClass) {
    Column() {
      Text(item.title).tabSty()

    }
    .onClick(() => {
      //通过获取索引值实现点击切换tab
      const index = this.btmTabList.findIndex(obj => obj.name === item.name)
      this.tabController.changeIndex(index)
    })
  }

  @Builder
  contentDialog() {
    Column() {
      Row() {
        Text('x')
          .fontSize(44)
          .fontColor(Color.White)
          .onClick(() => {
            this.showDialog = !this.showDialog
          })
      }.width('100%')
      .margin({
        top: 30,
        left: 20
      })
      .justifyContent(FlexAlign.Start)
    }.width('100%')
    .height('110%')
    .backgroundColor(Color.Black)
    .zIndex(999)
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Tabs({ index: $$this.currentIndex, controller: this.tabController, barPosition: BarPosition.End }) {
          ForEach(this.btmTabList, (item: BarClass) => {
            TabContent() {
              if (item.name === "Home") {
                TopBar()
              } else if (item.name === "Friend") {
                Text('Friend')
              }
              else if (item.name === "Message") {
                Text('meg')
              }
              else if (item.name === "My") {
                My()
              }
            }.tabBar(item.title)

          })
        }
        .animationDuration(0)
        .onClick(() => {
          this.IndexX = '0%'
        })
        .scrollable(false)

        Row({ space: 20 }) {
          ForEach(this.btmTabList, (item: BarClass) => {
            this.bottomBar(item)
          })
        }
        .width('100%')
        .height(75)
        .position({ y: '91%' })
        .backgroundColor(Color.Black)
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Image($r("app.media.ic_uploading"))
            .width(48)
            .height(48)
            .onClick(() => {
              this.showDialog = !this.showDialog
            })
        }.position({ x: '47%', y: '92.5%' })
        .onAppear(() => {
          window.getLastWindow(getContext())
            .then(win => {
              win.setWindowLayoutFullScreen(true)
              win.setWindowBackgroundColor('#ff373737')
            })
        })

      }
      .bindContentCover($$this.showDialog, this.contentDialog, {
        modalTransition: ModalTransition.DEFAULT
      })

      //TODO:封装好的侧边栏放在一个位置 方便改内容
      //左侧边栏
      SideBarCom({
        sideWidth: '100%',
        sidePositionX: '-100%'
      })
      //右侧边栏
      SideBarCom({
        sideWidth: '100%',
        sidePositionX: "100%",
        //必须传的值 关键数据！！！
        itemData: this.itemData,
        contentItem: (item: object) => {
          this.contentItem(item as BarClass)
        }
      })
    }

    //整个页面的坐标
    .translate({ x: this.IndexX })

    .animation({
      duration: 200,
      iterations: 1,
      playMode: PlayMode.Normal
    })
  }
}

