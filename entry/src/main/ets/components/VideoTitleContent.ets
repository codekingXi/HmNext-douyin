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
      Text(this.describe)// .maxLines(2)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .fontSize(20)
        .fontColor('#ffd7d7d7')
    }.width('100%')
    .alignItems(HorizontalAlign.Start).padding({ left: 15, bottom: 15, right: 15 })
  }
}