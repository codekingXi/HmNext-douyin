import { router } from '@kit.ArkUI'
import { ReplyInput } from '../../components/ReplyInput'
import { TOKEN_KEY } from '../../constants'
import { UserInfo, UserInfoModel } from '../../models'

@Entry
@Component
struct ChatDetail {
  @Provide
  talkUser: UserInfoModel = new UserInfoModel({} as UserInfo)
  @StorageProp(TOKEN_KEY)
  currentUser: UserInfoModel = new UserInfoModel({} as UserInfo)
  aboutToAppear(): void {

    this.getTalkUser()
  }
  async getTalkUser(){
    this.talkUser = router.getParams() as UserInfoModel
  }
  build() {
    Column() {
      Row() {
        Stack({ alignContent: Alignment.Start }) {
          Text('<')
            .width(30)
            .height(30).fontSize(30)
            .margin({left:10})
            .onClick(()=>{
              router.back()
            })
            .zIndex(2)
          Row({space:10}){
            Image(this.talkUser.avatar).width(40).height(40).borderRadius(20)
            Text(this.talkUser.username)
              .fontWeight(400)
              .fontSize(20)
              .fontColor('#000')
          }.margin({left:50})

        }.width('100%')
        .height(50)
      }.padding({
        left: 10,
        right: 10
      })
      Divider()
        .strokeWidth(.5)
        .color('#ff929292')
      Column(){

        ReplyInput({iptContent:'发送消息',publishComment:()=>{

        }}).position({x:'-50%',y:'90%'})
      }.layoutWeight(1).padding(10)
    }.margin({top:'10%'})
  }
}