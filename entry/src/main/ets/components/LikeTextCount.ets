import { Constants } from "../common"

/**
 * @param count 点赞数
 * @param isChangeColor 是否变化文本色
 * @param isWhite 是否默认白色 */
@Component
export struct LikeTextCount {
  @Require
  @Prop
  count: number = 0
  @Prop
  isChangeColor: boolean
  @Require
  @Prop
  isWhite: boolean

  build() {
    Row() {
      Text(this.count > 9999
        ? (this.count / 10000).toFixed(1) + '万'
        : this.count.toString())
        .fontSize(16)
        .fontColor(this.isWhite ? Color.White : this.isChangeColor ? Color.Red : Constants.COLOR_GREY)
    }
  }
}