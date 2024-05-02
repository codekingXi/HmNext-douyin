import { BarClass } from '../models/barData'
import { promptAction } from '@kit.ArkUI'

@Extend(Text)
function tabSty() {
  .fontColor(Color.White)
  .fontSize(24)

}

@Component
struct bottomNav {
  @State
  tabList: BarClass[] = [
    {
      id: 1,
      title: '首页',
      name: "Home",
      click: () => {
        promptAction.showToast({ message: 'Home' })
      }
    },
    {
      id: 2,
      title: '朋友',
      name: "Friend",
      click: () => {
        promptAction.showToast({ message: '朋友' })
      }
    },
    {
      id: 3,
      title: '+',
      name: "Function",
      click: () => {
        this.showDialog = !this.showDialog
      },
      image: $r("app.media.ic_uploading")
    },
    {
      id: 4,
      title: '信息',
      name: "Message",
      click: () => {
        promptAction.showToast({ message: 'mesg' })
      }
    },
    {
      id: 5,
      title: '我',
      name: "My",
      click: () => {
        promptAction.showToast({ message: 'me' })
      }
    }
  ]
  @State
  showDialog: boolean = false

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
    Row() {
      ForEach(this.tabList, (item: BarClass) => {
        Row() {
          if (item.name === "Function") {
            Image(item.image)
              .width(48)
              .aspectRatio(1)
          } else {
            Text(item.title)
              .tabSty()
          }
        }.onClick(() => {
          item.click && item.click()
        })
      })
    }
    //模态弹窗
    .bindContentCover($$this.showDialog, this.contentDialog, {
      modalTransition: ModalTransition.DEFAULT
    })
    .backgroundColor('#ff1d1d1d')
    .width('100%')
    .height(80)
    .justifyContent(FlexAlign.SpaceEvenly)
    .alignItems(VerticalAlign.Center)
    .position({
      y: '95%'
    })

  }
}


export { bottomNav }
