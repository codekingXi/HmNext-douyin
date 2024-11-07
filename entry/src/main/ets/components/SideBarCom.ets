/**
 * 侧边栏
 * @param itemData 侧边栏核心数据
 * @param contentItem 侧边栏内容
 * @param topContentArea 顶部内容插槽
 * @param contentMore 更多功能插槽
 * */

@Component
export struct SideBarCom {
  @Require
  @State
  itemData: object[] = []
  /**
   * 侧边栏内容*/
  @BuilderParam
  contentItem: (item: object) => void
  /**
   * 更多功能*/
  @BuilderParam
  contentMore: () => void
  @BuilderParam
  topContentArea: () => void
  /**
   * 侧边栏位置*/
  @State
  sidePositionX: string = ''
  sideBgColor: ResourceColor = Color.White
  sideBottom: number = 90
  sideLeft: number = 20
  sideRight: number = 20

  build() {
    Column() {
      List() {
        //卡片顶部内容有数据就渲染
        if (this.topContentArea) {
          ListItem() {
            this.topContentArea()
          }
        }
        //核心数据内容
        ForEach(this.itemData, (item: object) => {
          ListItem() {
            if (this.contentItem) {
              this.contentItem(item)
            }
          }
        })
      }
      .scrollBar(BarState.Off)
      .margin({ top: 50, bottom: this.sideBottom })
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
    .backgroundColor(this.sideBgColor)
    .width('70%')
    .height('100%')
    .padding({ left: this.sideLeft, right: this.sideRight })
    //侧边栏的默认绝对定位
    .position({ x: this.sidePositionX })
  }
}