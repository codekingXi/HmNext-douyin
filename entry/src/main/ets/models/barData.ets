// tabs
export interface BarClass{
  icon?:ResourceStr
  title?: string
  name?: string
  rightContent?: string
}
export class BarClassModel implements BarClass {
  icon?:ResourceStr= ""
  title?: string =""
  name?: string =""
  rightContent?: string =""

  constructor(model: BarClass) {
    this.icon = model.icon
    this.title = model.title
    this.name = model.name
    this.rightContent = model.rightContent
  }
}
