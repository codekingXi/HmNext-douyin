import { USER_SETTING, TOKEN_KEY } from '../constants'
import { preferences } from '@kit.ArkData'

export class UserSettingClass {
  //上下文
  context?: Context

  constructor(ctx: Context) {
    this.context = ctx
  }

  getStore() {
    return preferences.getPreferencesSync(this.context, {
      name: USER_SETTING
    })
  }

  //设置token
  async setUserToken(token: string) {
    const Store = this.getStore()
    Store.putSync(TOKEN_KEY, token)
    await Store.flush()
  }

  //获取token
  getUserToken() {
    const Store = this.getStore()
    return Store.getSync(TOKEN_KEY, "") as string
  }
}