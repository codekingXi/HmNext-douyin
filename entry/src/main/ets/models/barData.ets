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
//右侧边栏数据
export const itemData: BarClass[] = [
  {
    icon: $r('app.media.icon_shopCar'),
    title: "我的订单",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  },
  {
    icon: $r('app.media.icon_wallet'),
    title: "我的钱包",
    rightContent: '8.88',
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    }

  },
  {
    icon: $r('app.media.icon_QRcode'),
    title: "我的二维码",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true

  },
  {
    icon: $r('app.media.icon_time'),
    title: "观看历史",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true

  },
  {
    icon: $r('app.media.icon_waitplay'),
    title: "稍后再看",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true

  },
  {
    icon: $r('app.media.icon_clouddownload'),
    title: "离线模式",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  },
  {
    icon: $r('app.media.icon_idea'),
    title: "抖音创作着中心",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    }
  },
  {
    icon: $r('app.media.icon_applet'),
    title: "小程序",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  },
  {
    icon: $r('app.media.icon_love'),
    title: "抖音公益",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  },
  {
    icon: $r('app.media.icon_sapling'),
    title: "青少年模式",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  },
  {
    icon: $r('app.media.icon_service'),
    title: "我的客服",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  },
  {
    icon: $r('app.media.icon_setting'),
    title: "设置",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    }
  },
  {
    icon: $r('app.media.icon_personedetail'),
    title: "个人信息收集清单",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  },
  {
    icon: $r('app.media.icon_share'),
    title: "第三方信息共享清单",
    click: () => {
      promptAction.showToast({ message: "功能未完善" })
    },
    bottomBorder: true
  }
]