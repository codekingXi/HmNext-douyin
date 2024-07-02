/**
 * 自定义全局侧边栏
 * itemData 数据源必须传！！！
 * */
@Component
export struct SideBarCom {

  @State
  itemData: object[] = []
  /**
   * 右侧变栏内容*/
  @BuilderParam
  contentItem: (item: object) => void
  /**
   * 左侧边栏内容*/
  @BuilderParam
  contentBox: (item: object) => void
  /**
   * 更多功能*/
  @BuilderParam
  contentMore: () => void
  /**
   * 侧边栏位置*/
  @State
  sidePositionX: string = ''

  build() {
    Column() {
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
      }
      .scrollBar(BarState.Off)
      .margin({ top: 50, bottom: 70 })
      .padding({ right: 20 })
      //更多功能的按钮
      Row() {
        if (this.contentMore) {
          this.contentMore()
        }
      }
      .margin({ top: -80 })
      .padding({ right: 40 })
    }
    .padding({left:20,right:20})
    .width('70%')
    //侧边栏的默认绝对定位
    .position({ x: this.sidePositionX })
  }
}