/**
 * 图标按钮组件*/
@Component
export struct iconBtn {
  icon:ResourceStr=''
  title:string=''
  build() {
    Column({ space: 10 }) {
      Image(this.icon)
        .width(32)
      Text(this.title)
        .fontWeight(500)
        .fontSize(16)
    }
  }
}