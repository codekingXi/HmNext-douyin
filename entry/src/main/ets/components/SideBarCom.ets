/**
 * 自定义全局侧边栏
 * itemData 数据源必须传！！！
 * */
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
  @BuilderParam
  contentMore: () => void
  @State
  sidePositionX: string = ''

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
      if (this.contentMore) {
        this.contentMore()
      }
    }
    .scrollBar(BarState.Off)
    .padding({
      left: 20,
      right: 20,
      top: 50,
      bottom: 10
    })
    .width(this.sideWidth)
    .height('95%')
    //侧边栏的默认绝对定位
    .position({ x: this.sidePositionX })
  }
}