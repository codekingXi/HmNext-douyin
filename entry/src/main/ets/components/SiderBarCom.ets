/**
 * 自定义全局侧边栏
 * itemData 数据源必须传！！！
 * */
import { COLOR_WHITE } from '../common/color'

@Component
export struct SiderBarCom {
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
  siderBgColor: ResourceColor = COLOR_WHITE
  siderBottom:number=90
  siderLeft:number=20
  siderRight:number=20
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
      .margin({ top: 50, bottom: this.siderBottom })
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
    .backgroundColor(this.siderBgColor)
    .width('70%')
    .height('100%')
    .padding({left: this.siderLeft, right:this.siderRight})
    //侧边栏的默认绝对定位
    .position({ x: this.sidePositionX })
  }
}