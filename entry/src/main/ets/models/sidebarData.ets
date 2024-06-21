/**
 * 主页侧边栏数据接口*/
export interface sideData{
  id:number
  imgUrl: string| ResourceStr
  loveNum:number
  click?: ()=>void
}
