@Component
export struct Colm {
  @Styles
  Colum(){
    .width('100%')
    .height('100%').backgroundColor(Color.Gray)
  }

  build() {
    Column() {
      Text('敬请期待')
    }.Colum().justifyContent(FlexAlign.Center)
  }
}