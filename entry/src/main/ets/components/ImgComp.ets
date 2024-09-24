import { image } from '@kit.ImageKit'

type imgWidthOrHeight = string | number

/**
 * 二次封装的图片组件*/
@Component
export struct ImgComp {
  @Require
  imgSrc: image.PixelMap | ResourceStr | DrawableDescriptor = '' //图片地址
  @Require
  imgWidth: imgWidthOrHeight = 0 //宽度
  imgHeight: imgWidthOrHeight = 0 //高度
  isFillColor: boolean | null | undefined = null //是否填充颜色
  isDraggable: boolean = false //图片是否可拖拽
  ImageFitType: ImageFit = ImageFit.Contain //图片压缩类型
  color_1: ResourceColor = ''
  color_2: ResourceColor = ''

  build() {
    Image(this.imgSrc)
      .draggable(this.isDraggable)
      .width(this.imgWidth)
      .height(this.imgHeight)
      .objectFit(this.ImageFitType)
      .fillColor(this.isFillColor ? this.color_1 : this.color_2)
  }
}