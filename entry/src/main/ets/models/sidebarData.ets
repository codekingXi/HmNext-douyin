/** 主页侧边栏数据接口*/
export interface sideData {
  id: number
  imgUrl: ResourceStr
  loveNum: number
  click: () => void
  isLike?: boolean
}

@Observed
export class sideDataModel implements sideData {
  id: number = 0
  imgUrl: ResourceStr = ''
  loveNum: number = 0
  click: () => void
  isLike?: boolean = false

  constructor(model: sideData) {
    this.id = model.id
    this.imgUrl = model.imgUrl
    this.loveNum = model.loveNum
    this.click = model.click
    this.isLike = model.isLike
  }
}
