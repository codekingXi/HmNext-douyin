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
    Column() {
      Column(){
        Stack({alignContent:Alignment.BottomStart}) {
          Row() {
            Video({
              src: $rawfile("media/myTopBgMedia/Bg-video.mp4")
            }).width('100%')
              .height('100%')
              .objectFit(ImageFit.Cover)
              .muted(true)
              .loop(true)
              .autoPlay(true)
              .controls(false)
          }
          Row(){
            Row({ space: 20 }) {
              Row() {
                Image('https://c-ssl.dtstatic.com/uploads/blog/202206/16/20220616151457_21591.thumb.400_0.jpg')
                  .width(100).height(100)
                  .border({
                    width: 3,
                    color: Color.White,
                    radius: 50
                  })
              }

              Column({ space: 5 }) {
                Text(this.userInfo.username)
                Text(`抖音号: ${this.userInfo.tiktokNub}`)
                  .fontColor('#ff807f7f')
                  .fontSize(16)
              }
            }.margin({left:20})
          }
          .width('100%').height('50%')
          .linearGradient({
            direction:GradientDirection.Top,//渐变方向
            colors:[['rgba(7, 7, 7, 0.75)',0.4],['rgba(78, 77, 77, 0)',1.0]]
          })
        }
      }.layoutWeight(3.5).width('100%')


      Column() {
        // Button('退出登录')
        //   .onClick(() => {
        //     this.logout()
        //   })
      }.width('100%')
      .border({
        color: Color.White
      })
      .borderRadius({
        topLeft:10,topRight:10
      })
      .layoutWeight(6.5)
      .backgroundColor(Color.White)

    }

  }
}

export default My

