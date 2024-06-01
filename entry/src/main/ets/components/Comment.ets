import { commentDataModel } from '../models'
import { Fn } from '../pages/Index/Index'

@Preview
@Component
struct Comment {
  @ObjectLink
  item: commentDataModel
  //点赞方法
  changeLike(){
    if(this.item.likeFlag){ //如果点过赞
      this.item.likeNum--
    }//没点过赞
    else{
      this.item.likeNum++
    }
    this.item.likeFlag=!this.item.likeFlag
  }
  build() {

    Row({ space: 10 }) {
      Image(this.item.avatar)
        .width(40)
        .borderRadius(50)
      Column() {
        Text(this.item.author)
          .fontColor('#ff737373')
          .fontSize(18)
        Text(this.item.content)
          .fontColor('#ff1c1c1c')
          .fontSize(22)
        Row({ space: 10 }) {
          Row(){
            Text(`${this.item.time}-${this.item.area}`)
              .fontColor('#ff8d8b8b')
              .fontSize(18)
          }
          Row(){
            Image($r('app.media.ic_public_love'))
              .fillColor(this.item.likeFlag?Color.Red: '#ff868585')
              .width(20)
              .height(20)
              .onClick(()=>{
                new Fn().redirect()
                this.changeLike()
              })
            Text(this.item.likeNum.toString())
              .fontColor(this.item.likeFlag?Color.Red:'#ff868585')
              .fontSize(16)
          }
        }
        .width('100%')

        .justifyContent(FlexAlign.SpaceBetween)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .alignItems(VerticalAlign.Top)
    .width('100%')
    .padding({
      left: 20, right: 20
    })
  }
}

export { Comment }
