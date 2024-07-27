/**
 * 卡片项*/
import { Constants } from '../common/Constants'

@Component
export struct CardItem {
  icon: string | ResourceStr = ""
  leftTitle: string = ""
  rightContent?: string = ""

  build() {
    Row() {
      Row({ space: 10 }) {
        Image(this.icon)
          .width(20)
        Text(this.leftTitle)
          .fontSize(16)
      }

      if (this.rightContent) {
        Row() {
          Text('￥' + this.rightContent).textAlign(TextAlign.Center)
            .fontColor('#ff515151')

        }
        .width(60)
        .height(30)
        .borderRadius(40)
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Constants.COLOR_SiDerPay)
      }
    }.width('100%').height(60).justifyContent(FlexAlign.SpaceBetween)
  }
}