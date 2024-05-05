/**
 * 自定义全局侧边栏*/

@Component
export struct SideBarCom {
  @State
  sideWidth: number|string=""
  @State
  sideBgColor: string | ResourceColor = ""
  @State
  itemData:object[]=[]
  @BuilderParam
  contentItem:(item:object)=>void
  @BuilderParam
  contentBox:(item:object)=>void

  build() {
    List() {
      ForEach(this.itemData,(item:object)=>{
        ListItem(){
          if(this.contentItem){
            this.contentItem(item)
          }
          if(this.contentBox){
            this.contentBox(item)
          }
        }
      })
    }.padding({left:20,right:20,top:50,bottom:50})
    .width(this.sideWidth)
    .height('100%')
    .backgroundColor(this.sideBgColor)
  }
}