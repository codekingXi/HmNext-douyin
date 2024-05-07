/**
 * 自定义全局侧边栏*/
@Component
export struct SideBarCom {
  @State
  sideWidth: number | string = ""

  @State
  itemData: object[] = []
  @BuilderParam
  contentItem: (item: object) => void
  @BuilderParam
  contentBox: (item: object) => void
  @State
  sidePositionX:string=''
  build() {

    List() {
      ForEach(this.itemData, (item: object) => {
        ListItem() {
          if (this.contentItem) {
            this.contentItem(item)
          }
          if (this.contentBox) {
            this.contentBox(item)
          }
        }
      })
    }.padding({ left: 20, right: 20, top: 50, bottom: 50 })
    .width(this.sideWidth)
    .height('100%')
    //侧边栏的默认绝对定位
    .position({x:this.sidePositionX})
    .backgroundColor(Color.White)
  }
}