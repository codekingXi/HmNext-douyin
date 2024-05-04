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
      name: USER_SETTING  //仓库名
    })
  }

  //设置token
  async setUserToken(token: string) {
    const Store = this.getStore()
    Store.putSync(TOKEN_KEY, token) //将数据写入缓存的首选项实例中
    await Store.flush() //写入内存
  }

  //获取token
  getUserToken() {
    const Store = this.getStore()
    return Store.getSync(TOKEN_KEY, "") as string
  }
}