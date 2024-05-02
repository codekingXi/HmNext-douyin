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
