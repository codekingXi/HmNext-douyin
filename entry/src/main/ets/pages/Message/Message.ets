import { UserInfo } from '../../models/user'
import { UserSettingClass } from '../../utils/setting'
import { router } from '@kit.ArkUI'

@Entry
@Component
export default struct Message {
  @State
  userList:UserInfo[] = [] //渲染默认用户列表

  @Consume
  showDialog: boolean
  @Consume
  IndexX: number | string
  aboutToAppear(): void {
    this.getUserList()
  }
  getUserList() {
    this.userList = new UserSettingClass(getContext()).getTikTokConnect()
  }
  @Styles
  img(){
    .width(28).height(28)
  }
  build() {
    Column(){
      Row(){
        Image($r("app.media.icon_bar_sideBtn")).img()
          .onClick(()=>{
            this.showDialog=true
            this.IndexX = '70%'
          })
        Image($r('app.media.icon_meg_search')).img()
          .onClick(()=>{
            router.pushUrl({
              url:'pages/Search/SearchPage'
            })
          })
      }.width('100%').padding({left:15,top:'15%',right:15})
      .justifyContent(FlexAlign.SpaceBetween)
      List({space:15}){
        ForEach(this.userList,(item:UserInfo)=>{
          ListItem(){
            Row({space:10}){
              Image(item.avatar).width(70).height(70).border({radius:35})
              Row(){
                Column(){
                  Text(item.username).fontWeight(600).fontSize(24)
                  Text(item.content)
                }.width('100%').alignItems(HorizontalAlign.Start)
              }

            }.width('100%')
          }.layoutWeight(1)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/ChatDetail/ChatDetail',
              params:item
            })
          })
        })

      }.scrollBar(BarState.Off).margin({top:20,left:15,right:15})
    }.width('100%').height('100%').backgroundColor('#ffffffff')

  }
}