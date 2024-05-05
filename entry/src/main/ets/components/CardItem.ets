@Component
export struct CardItem {
  icon: string | ResourceStr = ""
  leftTitle: string = ""
  rightContent?: string = ""

  build() {
    Row() {
      Row({ space: 10 }) {
        Image(this.icon)
        Text(this.leftTitle)
      }

      if (this.rightContent) {
        Row() {
          Text('￥' + this.rightContent).textAlign(TextAlign.Center)
            .fontColor('#ff515151')

        }.backgroundColor('#ff9f9f9f').borderRadius(40)
      }
    }.width('100%').height(60).justifyContent(FlexAlign.SpaceBetween)
  }
}