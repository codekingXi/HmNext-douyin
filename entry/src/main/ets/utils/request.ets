import { Log } from '@abner/log'
import { http } from '@kit.NetworkKit'
import axios, { Axios, AxiosError, AxiosRequestConfig, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import { ChatResponse } from '../models/chat'

/*
 * 获取请求的方法*/
export async function getRequestMessage(content: string) {
  const req = http.createHttp() //创建请求
  try {
    const res =
      await req.request(`https://api.ownthink.com/bot?appid=xiaosi&userid=user&spoken=${encodeURIComponent(content)}`)
    return JSON.parse(res.result as string) as ChatResponse
  } catch (e) {
    return Promise.reject(e)
  } finally {
    req.destroy() //销毁请求
  }
}

//创建实例
const instance = axios.create({
  baseURL: 'http://api2.titodata.com', //基础地址
  timeout: 20000  //超时时间
})
//请求拦截器
instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  config.headers.Authorization =
    'eyJhbGciOiJIUzI1NiJ9.eyJjdXJyZW50VXNlciI6IntcInVzZXJuYW1lXCI6XCIzNTQyMzQ4NEBxcS5jb21cIixcInBhc3N3b3JkXCI6XCJcIixcIm5pY2tOYW1lXCI6XCLmiqTnkIblkZgxXCIsXCJlbWFpbFwiOlwiMzU0MjM0ODRAcXEuY29tXCIsXCJyZWFsTmFtZVwiOlwi5oqk55CG5ZGYMVwiLFwibW9iaWxlXCI6XCIxODIxMTAyMTg5NlwiLFwic2V4XCI6XCIwXCIsXCJkZXB0Tm9cIjpcIjEwMDAwMTAwNTAwMDAwMFwiLFwicG9zdE5vXCI6XCIxMDAwMDEwMDUwMDMwMDBcIixcImRhdGFTdGF0ZVwiOlwiMFwiLFwiYXZhdGFyXCI6XCJodHRwczovL3lqeS1vc3MtdmlkZW9zLm9zcy1hY2NlbGVyYXRlLmFsaXl1bmNzLmNvbS9ncnp4aHouanBnXCIsXCJpZFwiOjE2NzE0MDMyNTY1MTkwNzgyNzUsXCJjcmVhdGVUaW1lXCI6MTcxNTU2ODM5MDAwMCxcInVwZGF0ZVRpbWVcIjoxNzE1NTY4MzkwMDAwLFwiY3JlYXRlQnlcIjoxNjcxNDAzMjU2NTE5MDc4MTM4fSIsImV4cCI6MTQ2NzU2NTk0Nzd9.8PrMKBNrVVCfcI4DgICxp6oBQGqy46m3oglFQCiKtzw'
  //请求的参数
  return config
}, (error: AxiosError) => {
  //请求错误
  Log.error('3.异常信息' + JSON.stringify(error))
  return Promise.reject(error)
})
//响应拦截器
instance.interceptors.response.use((response: AxiosResponse) => {
  //response是服务器返回的结果
  if (response.data && response.data.code !== 200) {
    AlertDialog.show({ message: response.data.msg }) //提示错误
    return Promise.reject(new Error(response.data.msg)) //返回错误信息
  }
  Log.info('2.响应结果' + JSON.stringify(response.data))
  return response.data.data //返回需要的数据
}, (error: AxiosError) => {
  AlertDialog.show({ message: error.message }) //提示错误
  Log.error('3.异常信息' + JSON.stringify(error))
  return Promise.reject(error)
})

//r 是返回类型 d 是请求类型
export const request = <Response = null, DataParms = null>(config: AxiosRequestConfig) => {
  return instance.request<null, Response, DataParms>(config)
}

export { instance }