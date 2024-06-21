/**
 * 卡片*/
@Component
export struct Card {
  bottomBorder:boolean = true
  @BuilderParam
  CardFn:()=>void
  build() {
    Column(){
      Column(){
        if(this.CardFn){
          this.CardFn() //渲染传的内容
        }
      }
      .width('100%')

    }.padding({left:15,right:15})
    .backgroundColor(Color.White)
    .width('100%').border({
      color:'#ff888787',
      width:{
        bottom:this.bottomBorder?1:0
      }
    })
  }
}