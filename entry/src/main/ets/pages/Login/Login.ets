import { UserInfo, UserInfoModel } from '../../models/index'
import { promptAction, router } from '@kit.ArkUI'
import { TOKEN_KEY } from '../../constants/token'
import { UserSettingClass } from '../../utils/setting'
import { userData } from '../../api'

@Extend(Text)
function textStyle() {
  .fontColor(Color.Red).fontSize(16)
  .position({ x: 10, y: 65 })
}

@Entry
@Component
struct Login {
  @Styles
  ipt(){
    .width(300)
    .height(60)
    .border({
      radius: 8,
      width: 3,
      color: '#fff3f3f2'
    })
  }

  @State
  loading: boolean = false
  @State
  showText: boolean = false
  @State
  userName: string = ''
  @State
  userPwd: string = ''
  @State
  userInfo: UserInfoModel = new UserInfoModel({
    username: '',
    password: '',
    tiktokNub: 0
  } as UserInfo)

  getBtnEnable() {
    return !!(this.userInfo.username && this.userInfo.password)
  }

  login() {
    //因为没有真实数据，模拟登录
    if (this.userInfo.username.length < 6 && this.userInfo.password.length < 6 ||
      this.userInfo.username.length < 6 || this.userInfo.password.length < 6) {
      this.showText = !this.showText
      this.userName = '用户名长度不能小于6位'
      this.userPwd = '密码长度不能小于6位'
    } else {
      this.loading = true
      this.userInfo.tiktokNub = Math.floor(Math.random() * (99999999999 - 10000000000 + 1)) + 10000000000
      setTimeout(async () => {
        const token = userData(this.userInfo)
        promptAction.showToast({ message: token })
        if (this.userInfo.username && this.userInfo.password) {
          AppStorage.setOrCreate(TOKEN_KEY, token) //写入全局状态
          await new UserSettingClass(getContext()).setUserToken(token) //写入首选项
          this.loading = false
          router.replaceUrl({ url: 'pages/Index/Index' })
        } else {
          promptAction.showToast({ message: "账号或密码错误!" })
          this.loading = false
          return
        }
      }, 750)
    }


  }

  build() {
    Column({ space: 30 }) {
      Text("账号登录").fontSize(34)
        .fontColor(Color.Black)
      Row() {
        Column() {
          TextInput({ placeholder: "请输入用户名", text: this.userInfo.username })
            .onChange(value => { //因为数据只能监视到第一层的变化,只能用onchange绑定
              this.userInfo.username = value
            })
            .maxLength(10)
            .type(InputType.USER_NAME).ipt()
          if (this.showText) {
            Text(this.userName).textStyle()
          }
        }
      }

      Row() {
        Column() {
          TextInput({ placeholder: "请输入密码", text: this.userInfo.password })
            .onChange(value => {
              this.userInfo.password = value
            })
            .ipt()
            .maxLength(15)
            .type(InputType.Password)
          if (this.showText) {
            Text(this.userPwd).textStyle()
          }
        }
      }

      Button({ type: ButtonType.Normal }) {
        Row() {
          if (this.loading) {
            LoadingProgress().width(20).height(20).color(Color.White)
          }
          Text('一键登录，无账号将自动注册').fontSize(16)
        }
      }
      .width(250)
      .height(50)
      .borderRadius(8)
      .backgroundColor('#fff80606')
      .enabled(this.getBtnEnable())
      .onClick(() => {
        this.login()
      })
    }
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    .width('100%')
    .height('100%')
    .backgroundColor('#ff29e980')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

export default Login