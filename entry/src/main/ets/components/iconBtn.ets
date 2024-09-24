/**
 * 图标按钮组件*/
import { ImgComp } from '.'

@Component
export struct iconBtn {
  @Require
  icon: ResourceStr = ''
  @Require
  title: string = ''

  build() {
    Column({ space: 10 }) {
      ImgComp({
        imgSrc: this.icon,
        imgWidth: 26,
        isDraggable: false,
        ImageFitType: ImageFit.Contain
      })
      Text(this.title)
        .fontWeight(500)
        .fontSize(14)
    }
  }
}