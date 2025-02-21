import { mediaType, sideData } from '../models'
import { sideDataModel } from '../models/sidebarData'
import { Constants, tipDialog } from '../common'
import { ImgComp, LikeTextCount } from '.'

/**
 * 视频功能侧边栏*/
@Component
struct Sidebar {
  @Consume
  showCommentDialog: boolean
  @Prop
  item: mediaType //视频数据

  changeLike() {
    if (this.sideDataList[0].isLike) {
      this.sideDataList[0].Num!++
    } else {
      this.sideDataList[0].Num!--
    }
    this.sideDataList[0].isLike = !this.sideDataList[0].isLike
  }

  @Consume
  isShowNav: boolean
  @Consume
  dialogBgColor: ResourceColor
  //侧边栏图标和数据
  @State
  sideDataList: sideDataModel[] = [
    new sideDataModel({
      name: '点赞',
      imgUrl: $r('app.media.love'),
      Num: this.item.statistics.digg_count,
      isLike: false,
      click: () => {
        this.changeLike()
      }
    }),
    new sideDataModel({
      name: '评论',
      imgUrl: $r('app.media.chat'),
      Num: this.item.statistics.comment_count,
      click: () => {
        this.showCommentDialog = true //打开评论弹窗
        this.isShowNav = false //隐藏顶部栏
        this.dialogBgColor = Constants.COLOR_DIALOG_BG //修改弹层背景色
      }
    }),
    new sideDataModel({
      name: '收藏',
      imgUrl: $r('app.media.collect'),
      Num: this.item.statistics.comment_count,
      click: () => {
        tipDialog()
      }
    }),
    new sideDataModel({
      name: '分享',
      imgUrl: $r('app.media.transmit'),
      Num: this.item.statistics.share_count,
      click: () => {
        tipDialog()
      }
    })
  ]

  build() {
    //主内容
    Column() {
      ForEach(this.sideDataList, (item: sideData) => {
        sideIcon({ item: item })
      })
    }.zIndex(2)
    .position({ x: '82.5%', y: '50%' })
  }
}

export { Sidebar }

@Component
struct sideIcon {
  @ObjectLink
  item: sideDataModel
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
      this.item.click && this.item.click()
    }, 200)
  }

  build() {
    Column() {
      ImgComp({
        imgWidth: 45,
        imgSrc: this.item.imgUrl,
        isFillColor: this.item.isLike,
        color_1: Color.Red,
        color_2: Color.White
      }).aspectRatio(1)
        .scale({ x: this.scaleX, y: this.scaleY })
        .onClick(() => {
          this.change()
        })
        .animation({ duration: 200 })
      LikeTextCount({ count: this.item.Num, isWhite: true })
    }
  }
}
