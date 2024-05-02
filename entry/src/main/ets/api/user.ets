import { LoginFormModel } from '../models'
export const login = (data:LoginFormModel)=>{
  return JSON.parse(JSON.stringify(data))as string
}