import { BarClass } from '../../models'
import { TopBar } from '../../components'
import { window } from '@kit.ArkUI'
import My from '../My/My'

@Extend(Text)
function tabSty() {
  .fontColor(Color.White)
  .fontSize(24)

}

@Entry
@Component
struct Index {
  @State
  tabList: BarClass[] = [
    {
      title: '首页',
      name: "Home"
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

  @Builder
  bottomBar(item: BarClass) {
    Row() {
      Text(item.title).tabSty()
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.Black)
  }
  @State
  currentIndex: number = 0

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
    Stack() {
      Tabs({ index: $$this.currentIndex, barPosition: BarPosition.End }) {
        ForEach(this.tabList, (item: BarClass) => {
          TabContent() {
            if (item.name === "Home") {
              TopBar().margin({
                top:35
              })
            } else if (item.name === "Friend") {

            }
            else if (item.name === "Message") {

            }
            else if (item.name === "My") {
              My()
            }
          }.tabBar(this.bottomBar(item))
        })
      }.barPosition(BarPosition.End)
      Row(){
        Image($r("app.media.ic_uploading"))
          .width(48)
          .height(48)
          .onClick(()=>{
            this.showDialog=!this.showDialog
          })
      }.position({x:'44%',y:'94%'})
      .onAppear(()=>{
        window.getLastWindow(getContext())
          .then(win => {
            win.setWindowLayoutFullScreen(true)
            win.setWindowBackgroundColor('#ff5b5a5a')
          })
      })
    }.bindContentCover($$this.showDialog,this.contentDialog,{
      modalTransition:ModalTransition.DEFAULT
    })
  }
}


