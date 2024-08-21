// tabs
/**
 * tab栏的接口
 * 这个接口有多个渲染组件的地方会用到不能乱改*/
export interface BarClass {
  id?: number
  icon?: ResourceStr
  title?: string
  name?: string
  rightContent?: string
  click?: () => void
  bottomBorder?: boolean
}

export class BarClassModel implements BarClass {
  id?: number = 0
  icon?: ResourceStr = ""
  title?: string = ""
  name?: string = ""
  rightContent?: string = ""
  click?: () => void

  constructor(model: BarClass) {
    this.id = model.id
    this.icon = model.icon
    this.title = model.title
    this.name = model.name
    this.rightContent = model.rightContent
    this.click = model.click
  }
}

export let TabList: BarClass[] = [
  {
    id: 0,
    title: "经验",
    name: "EXPERIMENT"
  },
  {
    id: 1,
    title: "热点",
    name: "HOTPOT"
  },
  {
    id: 2,
    title: "直播",
    name: "LIVE"
  },
  {
    id: 3,
    title: "精选",
    name: 'SELECTED'
  },
  {
    id: 4,
    title: "团购",
    name: "LOT OF BUY"
  },
  {
    id: 5,
    title: "上海",
    name: "AREA"
  },
  {
    id: 6,
    title: "关注",
    name: "CONCERN"
  },
  {
    id: 7,
    title: "商场",
    name: "SHOP"
  },
  {
    id: 8,
    title: "推荐",
    name: "FOR YOU"
  }
]
