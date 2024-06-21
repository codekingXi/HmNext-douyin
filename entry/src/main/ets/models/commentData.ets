/**
 * 评论接口*/
export interface commentData{
  avatar: ResourceStr //头像
  id:number //评论的id
  content:string //评论内容
  time:string //发表时间
  author:string //作者
  area:string //地区
  likeNum:number //点赞数
  likeFlag:boolean |null //当前用户是否点过赞
}
@Observed //观察类的变化
export class commentDataModel implements commentData {
  avatar: ResourceStr = ''
  id: number = 0
  content: string = ''
  time: string = ''
  author: string = ''
  area: string = ''
  likeNum: number = 0
  likeFlag: boolean |null = null

  constructor(model: commentData) {
    this.avatar = model.avatar
    this.id = model.id
    this.content = model.content
    this.time = model.time
    this.author = model.author
    this.area = model.area
    this.likeNum = model.likeNum
    this.likeFlag = model.likeFlag
  }
}