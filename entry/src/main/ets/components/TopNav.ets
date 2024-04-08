
@Extend(Text)
function T(){
  .fontColor(Color.White)
  .fontSize(24)
}
@Preview
@Component
struct TopNav {

  build() {

      Row({space:20}){
        Text('音乐').T()
        Text('推荐').T()
      }
      .zIndex(2)
      .justifyContent(FlexAlign.Center)
      .position({
        y:"0%"
      })
      .width('100%')
      .height(50)


  }
}
export { TopNav }