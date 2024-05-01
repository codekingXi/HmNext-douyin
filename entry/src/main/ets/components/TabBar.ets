import { BarClass } from '../models/barData'
import { promptAction } from '@kit.ArkUI'
import { videoPage } from './VideoCom'

@Extend(Text)
function tabTsty() {
  .fontColor(Color.White)
  .fontSize(24)
  .lineHeight(50)
}

@Component
struct TabBar {
  @State
  tabList: BarClass[] = [
    {
      id: 1,
      title: '首页',
      name: "Home",

    },
    {
      id: 2,
      title: '朋友',
      name: "Friend",

    },
    {
      id: 3,
      title: '+',
      name: "Function",
      click: () => {
        this.showDialog = !this.showDialog
      }
    },
    {
      id: 4,
      title: '信息',
      name: "Message",

    },
    {
      id: 5,
      title: '我',
      name: "My",

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
    .height('120%')
    .backgroundColor(Color.Black)
    .zIndex(999)
  }

  build() {

  }
}


export { TabBar }
