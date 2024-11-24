import { common } from "../common"

/** 主页侧边栏数据接口*/
export interface sideData {
  name: string //唯一标识
  imgUrl: ResourceStr //图标地址
  Num?: number //数字
  click: () => void //事件
  isLike?: boolean //是否点赞
}

@Observed
export class sideDataModel implements sideData {
  name: string = ''
  imgUrl: ResourceStr = ''
  Num?: number = 0
  click: () => void
  isLike?: boolean = false

  constructor(model: sideData) {
    this.name = model.name
    this.imgUrl = model.imgUrl
    this.Num = model.Num || common.getRandomLikes()
    this.click = model.click
    this.isLike = model.isLike
  }
}

