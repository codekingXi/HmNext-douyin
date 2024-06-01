import { http } from '@kit.NetworkKit'
import { ChatResponse } from '../models/chat'
/*
 * 获取请求的方法*/
export async function getRequestMessage(content: string) {
  const req = http.createHttp() //创建请求
  try {
    const res = await req.request(`https://api.ownthink.com/bot?appid=xiaosi&userid=user&spoken=${encodeURIComponent(content)}`)
    return JSON.parse(res.result as string) as ChatResponse
  } catch (e) {
    return Promise.reject(e)
  }finally {
    req.destroy() //销毁请求
  }
}
