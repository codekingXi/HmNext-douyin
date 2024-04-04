export interface mediaInfo{
  title: string
  src: string|ResourceStr
  id:number
}
export class mediaInfoModel implements mediaInfo {
  title: string = ''
  src: string|ResourceStr = ''
  id: number = 0

  constructor(model: mediaInfo) {
    this.title = model.title
    this.src = model.src
    this.id = model.id
  }
}
