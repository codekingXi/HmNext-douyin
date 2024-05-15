// tabs
import { promptAction } from '@kit.ArkUI'

export interface BarClass {
  icon?: ResourceStr
  title?: string
  name?: string
  rightContent?: string
  click?: () => void
  bottomBorder?: boolean
}

export class BarClassModel implements BarClass {
  icon?: ResourceStr = ""
  title?: string = ""
  name?: string = ""
  rightContent?: string = ""
  click?: () => void

  constructor(model: BarClass) {
    this.icon = model.icon
    this.title = model.title
    this.name = model.name
    this.rightContent = model.rightContent
    this.click = model.click
  }
}
// 底部tab栏数据
export const btmTabList: BarClass[] = [
  {
    title: '首页',
    name: "Home",
  },
  {
    title: '朋友',
    name: "Friend",
  },
  {
    title: '信息',
    name: "Message",
  },
  {
    title: '我',
    name: "My",
  }
]