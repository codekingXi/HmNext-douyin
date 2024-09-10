/**
 * 卡片*/
@Component
export struct Card {
  bottomBorder: boolean = false
  /**
   * 卡片内容项*/
  @BuilderParam
  CardItem: () => void
  /**
   * 卡片顶部右侧提示*/
  @BuilderParam
  rightTip: () => void
  /**
   * 卡片标签*/
  leftTitle: string = ""
  bgColor: ResourceColor = Color.Transparent

  build() {
    Column({ space: 10 }) {
      Row() {
        Text(this.leftTitle)
          .fontSize(20)
        if (this.rightTip) {
          this.rightTip()
        }
      }.width('100%').justifyContent(FlexAlign.SpaceBetween)

      Column() {
        if (this.CardItem) {
          this.CardItem() //渲染传的内容
        }

      }
    }
    .margin({ top: 10, bottom: 10 })
    .padding(10)
    .backgroundColor(this.bgColor)
    .border({
      color: '#ff888787',
      radius: 15,
      width: {
        bottom: this.bottomBorder ? 1 : 0
      }
    })
  }
}