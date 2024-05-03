export interface LoginForm{
  account: string,
  password: string
}
export class LoginFormModel implements LoginForm {
  account: string = ''
  password: string = ''

  constructor(model: LoginForm) {
    this.account = model.account
    this.password = model.password
  }
}

export interface UserInfo {
  username: string //用户名
  password: string //用户密码
  tiktokNub: number //抖音号
  avatar: string //头像
}
@Observed
export class UserInfoModel implements UserInfo {
  username: string = ''
  password: string = ''
  tiktokNub: number = 0
  avatar: string = ''

  constructor(model: UserInfo) {
    this.username = model.username
    this.password = model.password
    this.tiktokNub = model.tiktokNub
    this.avatar = model.avatar
  }
}

