import { image } from '@kit.ImageKit'


/**
 * 二次封装的图片组件*/
@Component
export struct ImgComp {
  @Require
  @Prop
  imgSrc: image.PixelMap | ResourceStr | DrawableDescriptor = '' //图片地址
  @Require
  @Prop
  imgWidth: Length = 0 //宽度
  @Prop
  imgHeight: Length = 0 //高度
  @Prop
  isFillColor: boolean = false //是否填充颜色
  @Prop
  isDraggable: boolean = false //图片是否可拖拽
  @Prop
  ImageFitType: ImageFit = ImageFit.Contain //图片压缩类型
  @Prop
  color_1: ResourceColor = ''
  @Prop
  color_2: ResourceColor = ''
  @Prop
  bordWidth: number = 0
  @Prop
  bordRadius: number = 0
  @Prop
  bordColor: ResourceColor = ''

  build() {
    Image(this.imgSrc)
      .draggable(this.isDraggable)
      .width(this.imgWidth)
      .height(this.imgHeight ? this.imgHeight : null)
      .objectFit(this.ImageFitType)
      .fillColor(this.isFillColor ? this.color_1 : this.color_2)
      .border({
        width: this.bordWidth,
        color: this.bordColor,
        radius: this.bordRadius
      })
  }
}