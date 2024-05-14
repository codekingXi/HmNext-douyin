// tabs

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

