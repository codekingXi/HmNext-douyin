import { LoginFormModel } from '../models'
export const loginData = (data:LoginFormModel)=>{
  //使用静态数据不用和使用(封装登录请求)
  return JSON.stringify(data)
}