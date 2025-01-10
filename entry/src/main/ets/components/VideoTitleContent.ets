/**
 * @param title 视频标题
 * @param describe 视频描述 */
@Component
export struct VideoDescribe {
  @Require @Prop title: ResourceStr //视频标题
  @Require @Prop describe: string //视频描述

  build() {
    Column() {
      Text('@' + this.title)
        .fontSize(24)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)

      Text(this.describe)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .fontSize(20)
        .fontColor('#ffefefef')
    }.width('100%')
    .alignItems(HorizontalAlign.Start).padding({ left: 15, bottom: 15, right: 15 })
  }
}