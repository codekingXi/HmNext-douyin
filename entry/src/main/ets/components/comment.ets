import { commentData, commentDataModel } from '../models'

@Preview
@Component
struct comment {
  @ObjectLink
  item: commentDataModel

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
          Text(`${this.item.time}-${this.item.area}`)
            .fontColor('#ff8d8b8b')
            .fontSize(18)
          Image($r('app.media.ic_public_love'))
            .width(20)
            .height(20)
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

export { comment }
