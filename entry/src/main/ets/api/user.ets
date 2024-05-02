import { LoginFormModel } from '../models'
export const login = (data:LoginFormModel)=>{
  return JSON.stringify(data)
}