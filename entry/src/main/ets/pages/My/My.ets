import { router } from '@kit.ArkUI'
import { TOKEN_KEY } from '../../constants/token'
import { UserInfo, UserInfoModel } from '../../models/user'
import { UserSettingClass } from '../../utils/setting'

@Preview
@Component
struct My {
  userInfo: UserInfoModel = new UserInfoModel({} as UserInfo)

  /** 退出登录 */
  logout() {
    AppStorage.set(TOKEN_KEY, null) //清空全局状态
    new UserSettingClass(getContext()).setUserToken("") //清空首选项
    router.replaceUrl({
      url: 'pages/Login/Login'
    })
  }

  //随机的用户id
  randomNum() {
    const Uid = Math.floor(Math.random() * (99999999999 - 10000000000 + 1)) + 10000000000
    return Uid
  }

  aboutToAppear(): void {
    this.userInfo.tiktokNub = this.randomNum()
  }

  build() {
    Column({ space: 20 }) {
      Column(){
        Row({ space: 20 }) {
          Row() {
            Image('https://c-ssl.dtstatic.com/uploads/blog/202206/16/20220616151457_21591.thumb.400_0.jpg')
              .width(150).height(150)
              .border({
                width: 3,
                color: Color.White,
                radius: 75
              })

          }

          Column({ space: 5 }) {
            Text(this.userInfo.username)
            Text(`抖音号: ${this.userInfo.tiktokNub}`)
          }

        }
      }.width('100%').height(200)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('rgba(50, 49, 49, 0.5)')


      Row() {
        // Button('退出登录')
        //   .onClick(() => {
        //     this.logout()
        //   })
      }
    }.width('100%').height('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)

  }
}

export default My

