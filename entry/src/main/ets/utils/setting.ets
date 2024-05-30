import { USER_SETTING, TOKEN_KEY, TIKTOK_CONNECT, CURRENT_USER} from '../constants'
import { preferences } from '@kit.ArkData'
import { CurrentUser, defaultUserInfo, UserInfo, UserInfoModel } from '../models/user'

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
  //获取抖音联系人
  getTikTokConnect(){
    const Store = this.getStore()
    return JSON.parse(Store.getSync(TIKTOK_CONNECT,JSON.stringify(defaultUserInfo))as string)as UserInfoModel[]
  }
  async setCurrentUser(token: string) {
    const Store = this.getStore()
    Store.putSync(CURRENT_USER, token) //将数据写入缓存的首选项实例中
    await Store.flush() //写入内存
  }
  //获取当前用户
  getCurrentUser(){
    const Store = this.getStore()
    //如果首选项的用户数据是空字符串返回相关数据
    if(Store.getSync(CURRENT_USER,JSON.stringify(CurrentUser))){
      return JSON.parse(Store.getSync(CURRENT_USER,JSON.stringify(CurrentUser))as string)as UserInfoModel
    }else {
      //首次进入程序首选项没有任何数据返回一个空对象 防止出现无法进入程序等报错
      return new UserInfoModel({} as UserInfo)
    }

  }
}
