/**
 * 顶部导航栏*/
import { ImgComp } from '.'

@Component
export struct HeadBar {
  /**
   * 左侧图标*/
  LeftIcon: ResourceStr = ''
  /**
   * 右侧图标*/
  RightIcon: ResourceStr = ''
  /**
   * 左侧图标事件*/
  LeftIconClick: () => void = () => {
  }
  /**
   * 右侧图标事件*/
  RightIconClick: () => void = () => {
  }
  /**
   * 顶部栏内容区*/
  @BuilderParam
  BarMainContent: () => void

  build() {
    Row() {
      ImgComp({
        imgWidth:30,
        imgSrc:this.LeftIcon
      }).onClick(() => {
        this.LeftIconClick()
      })

      if (this.BarMainContent) {
        this.BarMainContent()
      }
      ImgComp({
        imgWidth:30,
        imgSrc:this.RightIcon,
      }).onClick(() => {
        this.RightIconClick()
      })
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 15, right: 15 })
  }
}