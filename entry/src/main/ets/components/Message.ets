import { CURRENT_USER } from '../constants'
import { UserInfo, UserInfoModel } from '../models'
import { MessageInfo, MessageInfoModel } from '../models/message'

@Component
export default struct Message {
  @StorageProp(CURRENT_USER)
  currentUser: UserInfoModel = new UserInfoModel({} as UserInfo) //聊天用户
  @Require
  @Prop
  currentMessage:MessageInfoModel = new MessageInfoModel({} as MessageInfo) //当前消息
  /**
   * @params
   * isOwnMessage是判断当前的登录用户id是否等于消息发送者的用户id设置元素的出现位置*/
  @State
  isOwnMessage:boolean = this.currentUser.user_id === this.currentMessage?.sendUser?.user_id //判断谁发的消息
  build() {
    Row(){
      Image(this.currentMessage.sendUser?.avatar)  //消息的发送者的头像
        .width(50)
        .aspectRatio(1)
        .borderRadius(25)
      Row(){
        Text(this.currentMessage.messageContent)  //消息的内容
          .backgroundColor(this.isOwnMessage?'#ff42ff0e':'#ffe9e9e9')
          .fontColor('#000')
          .padding(10)
          .margin({left:10,right:10})
          .borderRadius(4)
      }.justifyContent(this.isOwnMessage?FlexAlign.End:FlexAlign.Start)
      .layoutWeight(6)
      Text()
        .layoutWeight(1)
    }.padding({
      left:20,right:20
    })
    .direction(this.isOwnMessage?Direction.Rtl:Direction.Ltr)
  }
}