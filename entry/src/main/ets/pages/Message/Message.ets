import { UserInfo } from '../../models/user'
import { Tiktok } from '../../utils/setting'
import { router } from '@kit.ArkUI'
import { LOADING_ChatDetail, LOADING_SEARCH } from '../../router/Index'
import { COLOR_OpacityBlack } from '../../common/color/colors'
/**
 * 消息页面*/
@Entry
@Component
export default struct Message {
  @State
  userList:UserInfo[] = [] //渲染默认用户列表
  @Consume
  bgColor: string
  @Consume
  showDialog: boolean
  @Consume
  IndexX: number | string
  aboutToAppear(): void {
    this.getUserList()
  }
  getUserList() {
    this.userList = new Tiktok(getContext()).getTikTokConnect()
  }
  @Styles
  img(){
    .width(28).height(28)
  }
  build() {
    Column(){
      Row(){
        //顶部导航按钮
        Image($r("app.media.icon_bar_sideBtn")).img()
          .onClick(()=>{
            animateTo({duration:200},()=>{
              this.showDialog=true
              this.bgColor=COLOR_OpacityBlack
              this.IndexX = '70%'
            })
          })
        // 顶部搜索按钮
        Image($r('app.media.icon_meg_search')).img()
          .onClick(()=>{
            router.pushUrl({
              url:LOADING_SEARCH,
              params:{
                name:'搜索'
              }
            })
          })
      }.width('100%').padding({left:15,top:'15%',right:15})
      .justifyContent(FlexAlign.SpaceBetween)
      List({space:15}){
        ForEach(this.userList,(item:UserInfo)=> {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.avatar).width(70).height(70).border({ radius: 35 })
              Row() {
                Column() {
                  Text(item.username).fontWeight(600).fontSize(24)
                  Text(item.content)
                    .fontColor('#ff646464')
                    .fontSize(14)
                    .maxLines(1)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                }.width('100%').alignItems(HorizontalAlign.Start)
              }
            }.width('100%')
          }.layoutWeight(1)
          .onClick(() => {
            router.pushUrl({
              url: LOADING_ChatDetail,
              params: item
            })
          })
        })
      }.scrollBar(BarState.Off).margin({top:20,left:15,right:15})
    }.width('100%').height('100%').backgroundColor('#ffffffff')
  }
}