// tabs

export interface BarClass {
  id?:number
  icon?: ResourceStr
  title?: string
  name?: string
  rightContent?: string
  click?: () => void
  bottomBorder?: boolean
}

export class BarClassModel implements BarClass {
  id?:number=0
  icon?: ResourceStr = ""
  title?: string = ""
  name?: string = ""
  rightContent?: string = ""
  click?: () => void

  constructor(model: BarClass) {
    this.id=model.id
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
    id:1
  },
  {
    title: '朋友',
    name: "Friend",
    id:2
  },
  {
    title: '信息',
    name: "Message",
    id:3
  },
  {
    title: '我',
    name: "My",
    id:4
  }
]