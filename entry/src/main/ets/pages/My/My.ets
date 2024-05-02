import { router } from '@kit.ArkUI'
import { TOKEN_KEY } from '../../constants/token'
import { UserSettingClass } from '../../utils/setting'

@Component
struct My {
  @State
  message: string="已登录"
  aboutToAppear(): void {
    if(AppStorage.prop(TOKEN_KEY)){

    }else{
      this.message="未登录"
    }
  }
  /**
   * 退出登录
   * */
  logout(){
    AppStorage.set(TOKEN_KEY,"") //清空全局状态
    new UserSettingClass(getContext()).setUserToken("") //清空首选项
    router.replaceUrl({
      url:'pages/My/Login/Login'
    })
  }
  build() {
    Column({space:40}){
      Text(`token状态:${this.message}`)
        .fontSize(44)
      Row(){
        if(AppStorage.prop("")){
          Button('前往登录')
            .onClick(()=>{
              router.pushUrl({
                url:'pages/My/Login/Login'
              })
            })
        }


        Button('退出登录')
          .onClick(()=>{
            this.logout()
          })
      }
    }.width('100%').height('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)
  }
}
export default My
