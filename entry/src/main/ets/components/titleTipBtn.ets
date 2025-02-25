@Component
export struct TitleTipBtn {
  @Prop
  title: string = ''

  build() {
    Row(){
      Text(this.title).fontSize(16).fontColor(Color.White)
    }.backgroundColor(Color.Black)
    .justifyContent(FlexAlign.Center)
    .opacity(.5)
    .height(30)
    .width(50)
    .borderRadius(30)
  }
}