import { BarClass, btmTabList,itemData } from '../../models'
import { SideBarCom, TopBar } from '../../components'
import { window } from '@kit.ArkUI'
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
  btmTabList: BarClass[] = btmTabList
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
  itemData: BarClass[] = itemData

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
  // 上传视频等用的弹窗
  // @Builder
  // contentDialog() {
  //   Column() {
  //     Row() {
  //       Text('x')
  //         .fontSize(44)
  //         .fontColor(Color.White)
  //         .onClick(() => {
  //           this.showDialog = !this.showDialog
  //         })
  //     }.width('100%')
  //     .margin({
  //       top: 30,
  //       left: 20
  //     })
  //     .justifyContent(FlexAlign.Start)
  //   }.width('100%')
  //   .height('110%')
  //   .backgroundColor(Color.Black)
  //   .zIndex(999)
  // }

  build() {
    Column() {
      //底部的nav
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

        // Row() {
        //   Image($r("app.media.ic_uploading"))
        //     .width(48)
        //     .height(48)
        //     .onClick(() => {
        //       this.showDialog = !this.showDialog
        //     })
        // }.position({ x: '47%', y: '92.5%' })
        .onAppear(() => {
          window.getLastWindow(getContext())
            .then(win => {
              win.setWindowLayoutFullScreen(true)
              win.setWindowBackgroundColor('#ff373737')
            })
        })

      }
      // .bindContentCover($$this.showDialog, this.contentDialog, {
      //   modalTransition: ModalTransition.DEFAULT
      // })

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

