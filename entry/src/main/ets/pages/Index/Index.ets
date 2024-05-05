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

  @Provide
  sideBarPosition:boolean=false
  @State
  btmTabList: BarClass[] = [
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
  tabController:TabsController = new TabsController()
  @Builder
  bottomBar(item: BarClass) {
    Column(){
      Text(item.title).tabSty()

    }
    .onClick(()=>{
      //通过获取索引值实现点击切换tab
      const index = this.btmTabList.findIndex(obj=>obj.name===item.name)
      this.tabController.changeIndex(index)
    })
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
    Stack({alignContent:Alignment.Bottom}) {
      Tabs({ index: $$this.currentIndex,controller:this.tabController, barPosition: BarPosition.End }) {
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
      .scrollable(false)

     Row({space:20}){
        ForEach(this.btmTabList,(item:BarClass)=>{
          this.bottomBar(item)
        })
     }
     .width('100%').height(75)
     .position({y:'91%'})
     .backgroundColor(Color.Black).justifyContent(FlexAlign.SpaceAround)
      Row(){
        Image($r("app.media.ic_uploading"))
          .width(48)
          .height(48)
          .onClick(()=>{
            this.showDialog=!this.showDialog
          })
      }.position({x:'47%',y:'92.5%'})
      .onAppear(()=>{
        window.getLastWindow(getContext())
          .then(win => {
            win.setWindowLayoutFullScreen(true)
            win.setWindowBackgroundColor('#ff373737')
          })
      })
    }.bindContentCover($$this.showDialog,this.contentDialog,{
      modalTransition:ModalTransition.DEFAULT
    })
  }
}


