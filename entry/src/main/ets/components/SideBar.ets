import { commentDataModel } from '../models/commentData'
import { Comment } from './Comment'
import { ReplyInput } from './ReplyInput'
import commonFn from '../common/Function/commonFn'
import { sideData } from '../models'
import { sideDataModel } from '../models/sidebarData'

/**
 * 视频功能侧边栏*/
@Component
struct Sidebar {
  @State
  showDialog: boolean = false

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
        this.showDialog = !this.showDialog
      }
    }),
    new sideDataModel({
      id: 3,
      imgUrl: $r('app.media.collect'),
      loveNum: 344,
      click: () => {
        commonFn.tipDialog()
      }
    }),
    new sideDataModel({
      id: 4,
      imgUrl: $r('app.media.transmit'),
      loveNum: 568,
      click: () => {
        commonFn.tipDialog()
      }
    })
  ]
  //评论的数据
  @State commentList: commentDataModel[] = [
    new commentDataModel({
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34,
      likeFlag: false
    }),
    new commentDataModel({
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58,
      likeFlag: false
    }),
    new commentDataModel({
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10,
      likeFlag: false
    }),
    new commentDataModel({
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139,
      likeFlag: false
    }),
    new commentDataModel({
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29,
      likeFlag: false
    }),
    new commentDataModel({
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100,
      likeFlag: false
    })
  ]

  //添加评论方法
  addComment(content: string) {
    this.commentList.unshift(new commentDataModel({
      id: Math.random(),
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: 'smallMiSu7',
      content,
      time: `0${(new Date().getMonth() + 1).toString().padStart(2, '')}-${(new Date().getDate()
        .toString()
        .padStart(2, '0'))}`,
      area: '上海',
      likeNum: 34,
      likeFlag: false
    }))
  }

  @Builder
  Dialog() {
    Column() {
      Row() {
        Text(`${this.commentList.length}条评论`)
          .fontColor(Color.Black)
          .fontSize(16)
      }.margin({
        top: 50
      })

      List({ space: 20 }) {
        ForEach(this.commentList, (item: commentDataModel) => {
          ListItem() {
            Comment({ item: item })
          }
        })
      }.layoutWeight(1)
      .scrollBar(BarState.Off)

      //评论组件
      ReplyInput({
        publishComment: (content: string) => {
          this.addComment(content)
        },
        iptContent: '善语结善缘,恶言伤人心'
      })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    //主内容
    Column() {
      ForEach(this.sideDataList, (item: sideData) => {
        sideIcon({ item: item })
      })
    }.zIndex(2)
    .position({ x: '85%', y: '50%' })

    //半模态弹层
    .bindSheet($$this.showDialog, this.Dialog, {
      height: '65%',
      backgroundColor: '#ffefecec'
    })
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
  change(){
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
      Image(this.item.imgUrl)
        .fillColor(this.item.isLike ? Color.Red : Color.White)
        .width(50)
        .aspectRatio(1)
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