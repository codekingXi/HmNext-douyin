import { LoginForm, LoginFormModel } from '../../../models'
import { router } from '@kit.ArkUI'
import { login } from '../../../api'
import { TOKEN_KEY } from '../../../constants/token'
import { UserSettingClass } from '../../../utils/setting'

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
  accountForm: LoginFormModel = new LoginFormModel({
    account: '',
    password: ''
  } as LoginForm)

  getBtnEnable() {
    return !!(this.accountForm.account && this.accountForm.password)
  }

  login() {
    //因为没有真实数据，模拟登录
    this.loading = true
    setTimeout(async ()=>{
      const token = await login(this.accountForm)
      AppStorage.setOrCreate(TOKEN_KEY,token)//写入全局状态
      new UserSettingClass(getContext()).setUserToken(token) //写入首选项
      if (this.accountForm.account === 'admin' && this.accountForm.password === '123456') {
        AlertDialog.show({ message: "登录成功" })
        this.loading = false
        router.replaceUrl({ url: 'pages/Index/Index' })
      } else {
        AlertDialog.show({ message: "账号或密码错误!" })
        this.loading = false
        return
      }
    },750)
  }

  build() {
    Column({ space: 20 }) {
      Text("Welcome to 鸿蒙版抖音").fontSize(34)
        .fontColor(Color.Black)
      Row() {
        TextInput({ placeholder: "请输入用户名", text: this.accountForm.account })
          .onChange(value => { //因为数据只能监视到第一层的变化,只能用onchange绑定
            this.accountForm.account = value
          })
          .ipt()
          .maxLength(10)
          .type(InputType.USER_NAME)
      }

      Row() {
        TextInput({ placeholder: "请输入密码", text: this.accountForm.password })
          .onChange(value => {
            this.accountForm.password = value
          })
          .ipt()
          .maxLength(15)
          .type(InputType.Password)
      }

      Button({ type: ButtonType.Capsule }) {
        Row() {
          if (this.loading) {
            LoadingProgress().width(20).height(20).color(Color.White)
          }
          Text('登录')
        }
      }
      .width(200)
      .height(50)
      .backgroundColor('#ffffba05')
      .enabled(this.getBtnEnable())
      .onClick(() => {
        this.login()
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ff29e980')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

export default Login