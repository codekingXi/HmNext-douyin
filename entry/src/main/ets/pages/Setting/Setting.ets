import { TOKEN_KEY } from '../../constants'
import { router } from '@kit.ArkUI'
import { UserSettingClass } from '../../utils/setting'

@Entry
@Component
struct Setting {
  @BuilderParam
  CardItem:()=>void
  /** 退出登录 */
  logout() {
    AppStorage.set(TOKEN_KEY, null) //清空全局状态
    new UserSettingClass(getContext()).setUserToken("") //清空首选项
    router.replaceUrl({
      url: 'pages/Login/Login'
    })
  }
  build() {
    Column(){
      Row(){
        Row(){
          Text('<').width(50).height(50).fontColor('#ff2f2e2e').fontSize(50)
            .onClick(()=>{
              router.back()
            })
        }.margin({left:20})

      }.width('100%').height(50).position({
         y:'5%'
      })
      if(this.CardItem){
        this.CardItem
      }
      Button('退出登录')
        .onClick(() => {
          this.logout()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
  }
}