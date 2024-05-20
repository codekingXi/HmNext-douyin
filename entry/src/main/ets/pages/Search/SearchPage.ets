import { router } from '@kit.ArkUI'
@Entry
@Component
struct SearchPage {
  build() {
    Column() {
      Row({space:10}) {
        Search({ placeholder: '搜索' })
          .caretStyle({color:Color.Red})
          .border({
            radius: 8
          })
          .width('80%')
          .backgroundColor('#ffececec')
        Row(){
          Text('取消')
            .onClick(()=>{
              router.back()
            })
            .fontColor(Color.Black)
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
        }.width(80)

      }.margin({
        top:'15%'
      })
      .width('100%').height(50)
    }.padding({left:20,right:20}).width('100%').height('100%').backgroundColor(Color.White)
  }
}

export { SearchPage }