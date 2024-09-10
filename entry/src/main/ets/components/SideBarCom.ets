/**
 * 侧边栏
 * */

@Component
export struct SideBarCom {
  @Require
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