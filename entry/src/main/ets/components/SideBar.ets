import { sideData } from '../models'
import { sideDataModel } from '../models/sidebarData'
import { tipDialog } from '../common'
import { ImgComp } from '.'

/**
 * 视频功能侧边栏*/
@Component
struct Sidebar {
  @Consume
  showCommentDialog: boolean

  changeLike() {
    if (this.sideDataList[0].isLike) {
      this.sideDataList[0].loveNum--
    } else {
      this.sideDataList[0].loveNum++
    }
    this.sideDataList[0].isLike = !this.sideDataList[0].isLike
  }

  //侧边栏图标和数据
  @State
  sideDataList: sideDataModel[] = [
    new sideDataModel({
      id: 1,
      imgUrl: $r('app.media.love'),
      loveNum: 2010,
      isLike: false,
      click: () => {
        this.changeLike()
      }
    }),
    new sideDataModel({
      id: 2,
      imgUrl: $r('app.media.chat'),
      loveNum: 1650,
      click: () => {
        this.showCommentDialog = !this.showCommentDialog
        this.getUIContext()
      }
    }),
    new sideDataModel({
      id: 3,
      imgUrl: $r('app.media.collect'),
      loveNum: 344,
      click: () => {
        tipDialog()
      }
    }),
    new sideDataModel({
      id: 4,
      imgUrl: $r('app.media.transmit'),
      loveNum: 568,
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
    .position({ x: '85%', y: '50%' })

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
        imgWidth: 50,
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
      Text(this.item.loveNum.toString())
        .fontColor(Color.White)
        .fontSize(16)
    }
  }
}