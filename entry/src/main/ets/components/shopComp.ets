import { ImgComp } from '.'
import { shopType } from '../models'
import { router } from '@kit.ArkUI'
import { Constants } from '../common'

@Reusable
@Component
export struct shopComp {
  @Require
  @Prop
  item: shopType
  index: number = 0

  build() {
    Column({ space: 10 }) {
      ImgComp({
        imgWidth: '100%',
        imgSrc: this.item.cover
      })
        .height(this.index % 2 ? 180 : 200)
        .borderRadius({
          topLeft: 15, topRight: 15
        })
      Column() {
        Text(this.item.name)
        Row({ space: 5 }) {
          //价格
          Text(`￥${this.item.price.toString()}`)
            .fontColor(Color.Red).fontSize(16)
            .fontWeight(600)
          //已售
          Text(`已售${this.item.sold.toString()}`)
            .fontColor('#ff696868').fontSize(14)
        }
        .width('100%')
        .padding({
          left: 0,
          top: 10
        })
      }.margin(10)
    }.onClick(() => {
      router.pushUrl({
        url: Constants.SHOP_DETAIL,
        params: this.item
      })
    })
  }
}