import { customDialog, TitleBtn, TopBar } from '.'
import { Constants, tipDialog, VideoCtl } from '../common'
import { CURRENT_USER } from '../constants'
import { BarClass, TabList } from '../models'
import { CurrentUser, UserInfo, UserInfoModel } from '../models/user'
import { Store } from '../pages/Index/Index'
import { Fn } from '../pages/Index/Index'
import { Message } from '../pages/Message/Message'
import My from '../pages/My/My'
import { Tiktok } from '../utils/setting'
import { picker } from '@kit.CoreFileKit'
import { VideoPage } from '../pages/VideoPage/VideoPage'

@Component
export struct bottomNav {
  /**
   * 顶部栏信息*/
  @State
  topTabList: BarClass[] = TabList
  /**
   * 顶部栏索引*/
  @State
  topNavCurrentIndex: number = this.topTabList.length - 1
  /**
   * 是否显示上传弹窗*/
  @State
  showUploadDialog: boolean = false
  //底部tab的数据
  @State
  btmTabList: BarClass[] = [
    {
      title: '首页',
      name: "Home",
      id: 1
    },
    {
      title: '朋友',
      name: "Friend",
      id: 2,
      click: () => {
        Fn.redirect()
      }
    },
    {
      icon: $r('app.media.ic_uploading'),
      name: "Upload",
      id: 3,
      click: () => {
        Fn.redirect()
        if (Store.getSync(CURRENT_USER, CurrentUser)) {
          this.showUploadDialog = true
        }
      }
    },
    {
      title: '信息',
      name: "Message",
      id: 4,
      click: () => {
        Fn.redirect()
      }
    },
    {
      title: '我',
      name: "My",
      id: 5,
      click: () => {
        Fn.redirect()
      }
    }
  ]
  tabController: TabsController = new TabsController()
  @State
  currentIndex: number = 0
  @State
  userInfo: UserInfoModel = new UserInfoModel({} as UserInfo)

  //底部title字体的颜色
  @State
  titleColor: ResourceColor[] = [Color.White, Color.Gray]
  /**
   * 是否显示弹窗 */
  @Consume
  showDialog: boolean
  @Provide
  bgColor: ResourceColor = '' //修改渐变背景色只能通过#00000000的方式
  @Provide
  info: UserInfoModel = new Tiktok(getContext()).getCurrentUser()
  @Consume
  IndexX: number | string //整个index页面的x坐标
  /*
   * 图片选择数量*/
  maxImgNumber: number = 1 //最多可选1张图片

  /**
   * 选择图片*/
  async selectPhoto() {
    const photo = new picker.PhotoViewPicker() //图片选择对象
    const result = await photo.select({
      //选择类型
      MIMEType: picker.PhotoViewMIMETypes.IMAGE_TYPE,
      //最大可选数量
      maxSelectNumber: this.maxImgNumber
    })
    //如果有图片 这里的业务只需要单个图片
    if (result.photoUris.length) {
      this.info.avatar = result.photoUris.toString()
      const token = this.info
      await new Tiktok(getContext()).setCurrentUser(JSON.stringify(token)) //写入首选项
    }
  }

  /**
   * 播放视频*/
  startVideo() {
    VideoCtl.start()
  }

  /**
   * 暂停视频*/
  pauseVideo() {
    VideoCtl.pause()
  }

  // 上传视频等用的弹窗
  @Builder
  contentDialog() {
    Column() {
      Row() {
        Text('x')
          .fontSize(44)
          .fontColor(Color.White)
          .onClick(() => {
            this.showUploadDialog = false
          })
      }.width('100%')
      .margin({
        top: 30,
        left: 20
      })
      .justifyContent(FlexAlign.Start)
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .zIndex(99999)
  }

  /**
   * 头像详情界面*/
  @Builder
  imgAvatar() {
    Column({ space: 40 }) {
      Text('x')
        .fontSize(54)
        .fontColor(Color.White)
        .fontWeight(100)
        .onClick(() => {
          this.showDialog = false
        })
        .margin({ top: "5%", left: '-85%' })
      Image(this.info.avatar)
        .draggable(true)
        .height('50%')
        .width('100%')
      Column() {
        TitleBtn({
          title: "创建抖音仔仔", borBom: true, click: () => {
            tipDialog()
          }
        })
        TitleBtn({
          title: "更换头像", borBom: true, click: () => {
            this.selectPhoto()
          }
        })
        TitleBtn({
          title: "保存头像", borBom: true, click: () => {
            tipDialog()
          }
        })
        TitleBtn({
          title: "查看抖音码", borBom: false, click: () => {
            tipDialog()
          }
        })
      }.width('90%')
      .borderRadius(10)
      .margin({ top: -20 })
    }
  }

  //底部tab的的结构
  @Builder
  bottomBar(item: BarClass, index: number) {
    Column() {
      if (item.id === 3) {
        Image(item.icon)
          .width(50).aspectRatio(1)
      } else {
        Text(item.title)
          .fontSize(24)
          .fontColor(this.currentIndex === index ? this.titleColor[0] : this.titleColor[1])
      }
    }
    .onClick(() => {
      //通过获取索引值实现点击切换tab
      item.click && item.click()
      if (Store.getSync(CURRENT_USER, JSON.stringify(CurrentUser))) {
        if (item.id !== 3) {
          const index = this.btmTabList.findIndex(obj => obj.name === item.name)
          this.tabController.changeIndex(index)
          if (item.id !== 1) {
            this.pauseVideo()
          }
          //如果底部栏索引是首页且顶部栏索引是推荐页开启播放器
          if (item.id === 1 && this.topNavCurrentIndex === this.topTabList.length - 1) {
            this.startVideo()
          }
        }
        //如果是功能按钮关闭播放器
        if (item.id === 3) {
          this.pauseVideo()
        }
      }
    })
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Tabs({ index: $$this.currentIndex, controller: this.tabController, barPosition: BarPosition.End }) {
        ForEach(this.btmTabList, (item: BarClass) => {
          TabContent() {
            if (item.name === 'Home') {
              TopBar({ topNavCurrentIndex: this.topNavCurrentIndex })
            } else if (item.name === 'Friend') {
              VideoPage()
            } else if (item.name === 'Message') {
              Message()
            } else if (item.name === 'My') {
              My()
            }
          }
        })
      }
      .animationDuration(0)
      .scrollable(false)

      Row({ space: 20 }) {
        ForEach(this.btmTabList, (item: BarClass, index: number) => {
          this.bottomBar(item, index)
        })
      }
      .width('100%')
      .height(75)
      .position({ y: '91.1%' })
      .backgroundColor(Constants.COLOR_GrayNAV)
      .justifyContent(FlexAlign.SpaceAround)
      //全屏模态弹窗
      .bindContentCover($$this.showUploadDialog, this.contentDialog, {
        modalTransition: ModalTransition.DEFAULT
      })

      //默认不显示遮罩层
      if (this.showDialog) {
        customDialog({
          imgAvatar: () => {
            if (this.bgColor === Color.Black) {
              this.imgAvatar()
            }
          }
        })
          .onClick(() => {
            animateTo({ duration: 200 }, () => {
              //通过判断色值区别弹窗是哪个页面的再进行相应改变
              if (this.bgColor !== Color.Black) {
                this.showDialog = !this.showDialog
                this.IndexX = '0%' //修改整个Index界面的x坐标
                this.pauseVideo()
              }
            })
          })
      }
    }
  }
}