import { defaultUserInfo, TalkUserInfo } from '../../models/user'

@Entry
@Component
export default struct Message {
  @State
  userList:TalkUserInfo[]= defaultUserInfo //渲染默认用户列表
  build() {
    Column(){
      List({space:15}){
        ForEach(this.userList,(item:TalkUserInfo)=>{
          ListItem(){
            Row({space:10}){
              Image(item.talkAvatar).width(70).height(70).border({radius:35})
              Row(){
                Column(){
                  Text(item.talkUsername).fontWeight(600).fontSize(24)
                  Text(item.talkContent)
                }.width('100%').alignItems(HorizontalAlign.Start)
              }

            }.width('100%')
          }.layoutWeight(1)
        })

      }.scrollBar(BarState.Off).margin({top:50,left:15,right:15})
    }.width('100%').height('100%').backgroundColor('#ffffffff')

  }
}