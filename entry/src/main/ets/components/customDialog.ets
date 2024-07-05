/**
 * 弹窗组件*/
@CustomDialog
@Component
export struct customDialog {
  controller: CustomDialogController
  @Consume
  bgColor: ResourceColor
  @BuilderParam
  imgAvatar: () => void //头像

  build() {
    Column() {
      if (this.imgAvatar) {
        this.imgAvatar()
      }
    }
    .width('100%').height('100%').backgroundColor(this.bgColor)
  }
}