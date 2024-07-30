/**
 * 图标按钮组件*/
@Component
export struct iconBtn {
  @Require
  icon: ResourceStr = ''
  @Require
  title: string = ''

  build() {
    Column({ space: 10 }) {
      Image(this.icon)
        .width(26)
      Text(this.title)
        .fontWeight(500)
        .fontSize(14)
    }
  }
}