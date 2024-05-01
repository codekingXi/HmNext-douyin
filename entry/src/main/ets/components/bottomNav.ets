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
      click:()=>{
        promptAction.showToast({message:'success'})
      }
    },
    {
      id: 2,
      title: '朋友',
      name: "Friend",
      click:()=>{
        promptAction.showToast({message:'success'})
      }
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
      click:()=>{
        promptAction.showToast({message:'success'})
      }
    },
    {
      id: 5,
      title: '我',
      name: "My",
      click:()=>{
        promptAction.showToast({message:'success'})
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
      Stack() {
        Row() {
          ForEach(this.tabList, (item: BarClass) => {
            Text(item.title).tabSty()
              .onClick(() => {
                item.click && item.click()
              })
          })
        }.justifyContent(FlexAlign.SpaceEvenly)
        .zIndex(2)
        .width('100%')
        Row() {
          Text()
            .tabSty()
            .width(40)
            .aspectRatio(1)
            .borderRadius(8)
            .border({
              width: 3,
              color: Color.White
            })
        }.position({x:'47.5%'}).zIndex(1)
      }
    }
    //模态弹窗
    .bindContentCover($$this.showDialog, this.contentDialog, {
      modalTransition: ModalTransition.DEFAULT
    })
    .backgroundColor('#ff1d1d1d')
    .width('100%')
    .height(80)

    .alignItems(VerticalAlign.Center)
    .position({
      y: '95%'
    })

  }
}


export { bottomNav }
