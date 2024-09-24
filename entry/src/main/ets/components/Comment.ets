import { ImgComp } from '.'
import { CURRENT_USER } from '../constants'
import { commentDataModel } from '../models'
import { CurrentUser } from '../models/user'
import { Fn, Store } from '../pages/Index/Index'

/**
 * 评论区内容组件*/
@Component
export struct Comment {
  @ObjectLink
  item: commentDataModel

  //点赞方法
  changeLike() {
    if (this.item.likeFlag) { //如果点过赞
      this.item.likeNum--
    } //没点过赞
    else {
      this.item.likeNum++
    }
    this.item.likeFlag = !this.item.likeFlag
  }

  @State
  scaleX: number = 1
  @State
  scaleY: number = 1

  /**
   * 动画*/
  change() {
    this.scaleX = 0
    this.scaleY = 0
    setTimeout(() => {
      this.scaleX = 1
      this.scaleY = 1
      this.changeLike()
    }, 200)
  }

  build() {

    Row({ space: 10 }) {
      ImgComp({
        imgSrc: this.item.avatar, //头像
        imgWidth: 40
      })
        .borderRadius(50)
      Column() {
        Text(this.item.author)//作者
          .fontColor('#ff737373')
          .fontSize(18)
        Text(this.item.content)//内容
          .fontColor('#ff1c1c1c')
          .fontSize(22)
        Row({ space: 10 }) {
          Row() {
            Text(`${this.item.time}-${this.item.area}`)//事件地区
              .fontColor('#ff8d8b8b')
              .fontSize(18)
          }

          Row() {
            ImgComp({
              imgWidth: 20,
              imgSrc: $r('app.media.ic_public_love'),
              isFillColor: this.item.likeFlag,
              color_1: Color.Red,
              color_2: '#ff868585'//爱心
            })
              .scale({ x: this.scaleX, y: this.scaleY })
              .onClick(() => {
                Fn.redirect()
                //如果有账号信息
                if (Store.getSync(CURRENT_USER, JSON.stringify(CurrentUser))) {
                  this.change()
                }
              })
              .animation({ duration: 200 })
            Text(this.item.likeNum.toString())//点赞数
              .fontColor(this.item.likeFlag ? Color.Red : '#ff868585')
              .fontSize(16)
          }
        }
        .width('100%')

        .justifyContent(FlexAlign.SpaceBetween)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .alignItems(VerticalAlign.Top)
    .width('100%')
    .padding({
      left: 20, right: 20
    })
  }
}


