@Preview
@Component
export struct HeadBar {
  /**
   * 左侧图标*/
  @Require
  @State
  LeftIcon: ResourceStr = ''
  /**
   * 右侧图标*/
  @Require
  @State
  RightIcon: ResourceStr = ''
  /**
   * 左侧图标事件*/
  @Require
  LeftIconClick: () => void = () => {
  }
  /**
   * 右侧图标事件*/
  @Require
  RightIconClick: () => void = () => {
  }
  /**
   * 顶部栏内容区*/
  @BuilderParam
  BarMainContent:()=>void
  @Styles
  Img(){
    .width(30)
    .height(30)
  }

  build() {
    Row() {
      Image(this.LeftIcon)
        .Img()
        .onClick(() => {
          this.LeftIconClick()
        })
      if(this.BarMainContent){
        this.BarMainContent()
      }
      Image(this.RightIcon)
        .Img()
        .onClick(() => {
          this.RightIconClick()
        })
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 15, right: 15 })
  }
}