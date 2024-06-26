import { BarClass, UserInfo, UserInfoModel } from '../../models'
import { SideBarCom, TitleBtn, TopBar } from '../../components'
import { promptAction, router } from '@kit.ArkUI'
import My from '../My/My'
import customDialog from '../../components/customDialog'
import Message from '../Message/Message'
import { CURRENT_USER } from '../../constants'
import { Tiktok } from '../../utils/setting'
import { CurrentUser } from '../../models/user'
import { picker } from '@kit.CoreFileKit'
import commonFn from '../../common/Function/commonFn'
import { LOADING_LOGIN, LOADING_SETTING } from '../../router/Index'
import { COLOR_BLACK, COLOR_GRAY, COLOR_WHITE } from '../../common/color/colors'

export const Store = new Tiktok(getContext()).getStore()
/**
 * 功能*/
export class Fn {
  //跳转页面 重定向
  static redirect() {
    //如果不是空字符串跳转到登录页 转为false(已登录状态) 因为首选项的用户数据开始是空对象才会启动跳转
    if (!Store.getSync(CURRENT_USER, CurrentUser)) {
      AlertDialog.show({
        title: '登录状态监测',
        message: '请先登录!',
        alignment: DialogAlignment.Center,
        confirm: {
          value: '确定',
          action: () => {
            router.pushUrl({
              url: LOADING_LOGIN
            })
          }
        }
      })
    }
  }
}

@Entry
@Component
struct Index {
  // aboutToAppear(): void {
  //
  // }
  onBackPress(): boolean | void {
    commonFn.tipOutPage()
  }
  @Provide
  info: UserInfoModel = new Tiktok(getContext()).getCurrentUser()
  @State
  userInfo: UserInfoModel = new UserInfoModel({} as UserInfo)
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
    }, {
    icon: $r('app.media.ic_uploading'),
    name: "上传",
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
  @Provide
  IndexX: number | string = '' //整个index页面的x坐标
  @State
  currentIndex: number = 0
  @Provide
  showDialog: boolean = false
  @State
  showUploadDialog: boolean = false
  @Provide
  bgColor: ResourceColor = '' //修改渐变背景色只能通过#00000000的方式
  @State
  sidePosition: boolean = false
  //因为有改变页面元素的事件所以不能和接口放在一个文件
  //右侧边栏的数据
  @State
  itemData: BarClass[] = [
    {
      icon: $r('app.media.icon_shopCar'),
      title: "我的订单",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_wallet'),
      title: "我的钱包",
      rightContent: '8.88',
      click: () => {
        commonFn.tipDialog()
      }

    },
    {
      icon: $r('app.media.icon_QRcode'),
      title: "我的二维码",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true

    },
    {
      icon: $r('app.media.icon_time'),
      title: "观看历史",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true

    },
    {
      icon: $r('app.media.icon_waitplay'),
      title: "稍后再看",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true

    },
    {
      icon: $r('app.media.icon_clouddownload'),
      title: "离线模式",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_idea'),
      title: "抖音创作着中心",
      click: () => {
        commonFn.tipDialog()
      }
    },
    {
      icon: $r('app.media.icon_applet'),
      title: "小程序",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_love'),
      title: "抖音公益",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_sapling'),
      title: "青少年模式",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_service'),
      title: "我的客服",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_setting'),
      title: "设置",
      click: () => {
        router.pushUrl({
          url: LOADING_SETTING
        })
      }
    },
    {
      icon: $r('app.media.icon_personedetail'),
      title: "个人信息收集清单",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    },
    {
      icon: $r('app.media.icon_share'),
      title: "第三方信息共享清单",
      click: () => {
        commonFn.tipDialog()
      },
      bottomBorder: true
    }
  ]
  //底部title字体的颜色
  @State
  titleColor: ResourceColor[] = [COLOR_WHITE, COLOR_GRAY]

  //右侧侧边栏的结构
  @Builder
  contentItem(item: BarClass) {

    Row() {
      Row({ space: 10 }) {
        Image(item.icon).width(20).height(20)
        Text(item.title).fontSize(16)
      }

      if (item.rightContent) {
        Row() {
          Text('￥' + item.rightContent).textAlign(TextAlign.Center)
            .fontSize(16)
            .fontColor('#ff515151')
        }
        .width(60)
        .height(30)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('rgba(227, 227, 227, 0.50)')
        .borderRadius(40)
      }
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .onClick(() => {
      item.click && item.click()
    })
    .border({
      width: {
        bottom: item.bottomBorder === true ? 0 : 0.5
      }
    })
  }

  //底部tab的的结构
  @Builder
  bottomBar(item: BarClass) {
    Column() {
      if (item.id === 3) {
        Image(item.icon)
          .width(50).aspectRatio(1)
      } else {
        Text(item.title)
          .fontSize(24)
          .fontColor(this.btmTabList[this.currentIndex].id === item.id ? this.titleColor[0] : this.titleColor[1])
      }
    }
    .onClick(async () => {
      //通过获取索引值实现点击切换tab
      item.click && item.click()
      if (Store.getSync(CURRENT_USER, JSON.stringify(CurrentUser))) {
        if (item.id !== 3) {
          const index = this.btmTabList.findIndex(obj => obj.name === item.name)
          this.tabController.changeIndex(index)
        }
      }
    })
  }

  //更多功能
  @Builder
  moreFn() {
    Row() {
      Button() {
        Row({ space: 10 }) {
          Image($r("app.media.icon_moreFn")).width(24).height(24)
          Text('更多功能')
        }.width('100%').justifyContent(FlexAlign.Center)
      }
      .type(ButtonType.Normal)
      .backgroundColor(Color.White)
      .width('100%')
      .height(50)
      .border({
        radius: 4,
        width: .7,
        color: '#ff1d1d1d'
      })
      .margin({
        top: 5,
        left: 15,
        right: 15,
        bottom: 20
      })
      .onClick(() => {
        commonFn.tipDialog()
      })
    }.width('90%').justifyContent(FlexAlign.Center)
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
    .height('110%')
    .backgroundColor(Color.Black)
    .zIndex(999)
  }

  /*
   * 图片选择*/
  maxImgNumber: number = 1 //最多可选1张图片

  public async selectPhoto() {
    const photo = new picker.PhotoViewPicker() //图片选择对象
    const result = await photo.select({
      //选择类型
      MIMEType: picker.PhotoViewMIMETypes.IMAGE_TYPE,
      //最大可选数量
      maxSelectNumber: this.maxImgNumber
    })
    //如果有图片
    if (result.photoUris.length) {
      this.info.avatar = result.photoUris.toString()
      const token = this.info
      await new Tiktok(getContext()).setCurrentUser(JSON.stringify(token)) //写入首选项
    }
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
            commonFn.tipDialog()
          }
        })
        TitleBtn({
          title: "更换头像", borBom: true, click: () => {
            this.selectPhoto()
          }
        })
        TitleBtn({
          title: "保存头像", borBom: true, click: () => {
            commonFn.tipDialog()
          }
        })
        TitleBtn({
          title: "查看抖音码", borBom: false, click: () => {
            commonFn.tipDialog()
          }
        })
      }.width('90%')
      .borderRadius(10)
      .margin({ top: "-5%" })
    }

  }

  build() {
    Column() {
      //底部的nav
      Stack({ alignContent: Alignment.Bottom }) {
        Tabs({ index: $$this.currentIndex, controller: this.tabController, barPosition: BarPosition.End }) {
          ForEach(this.btmTabList, (item: BarClass) => {
            TabContent() {
              if (item.id === 1) {
                TopBar()
              } else if (item.id === 2) {
                Text('Friend')
              } else if (item.id === 4) {
                Message()
              } else if (item.id === 5) {
                My()
              }
            }.tabBar()

          })
        }
        .animationDuration(0)

        .scrollable(false)

        Row({ space: 20 }) {
          ForEach(this.btmTabList, (item: BarClass) => {
            this.bottomBar(item)
          })
        }
        .width('100%')
        .height(75)
        .position({ y: '91.1%' })
        .backgroundColor(Color.Black)
        .justifyContent(FlexAlign.SpaceAround)

        // Row() {
        //   Image($r("app.media.ic_uploading"))
        //     .width(48)
        //     .height(48)
        //     .onClick(() => {
        //       this.showDialog = !this.showDialog
        //     })
        // }.position({ x: '47%', y: '92.5%' })
        //默认不显示遮罩层
        if (this.showDialog) {
          customDialog({
            imgAvatar: () => {
              if (this.bgColor === COLOR_BLACK) {
                this.imgAvatar()
              }
            }
          })
            .onClick(() => {
              animateTo({ duration: 200 }, () => {
                //通过判断色值区别弹窗是哪个页面的再进行相应改变
                if (this.bgColor !== COLOR_BLACK) {
                  this.showDialog = !this.showDialog
                  this.IndexX = '0%' //修改整个Index界面的x坐标
                }
              })
            })
        }
      }
      .bindContentCover($$this.showUploadDialog, this.contentDialog, {
        modalTransition: ModalTransition.DEFAULT
      })

      //封装好的侧边栏放在一个位置 方便改内容
      //左侧边栏
      SideBarCom({
        sideWidth: '70%',
        sidePositionX: '-70%'
      })
      //右侧边栏
      SideBarCom({
        sideWidth: '65%',
        sidePositionX: "100%",
        //必须传的值 关键数据！！！
        itemData: this.itemData,
        contentItem: (item: object) => {
          this.contentItem(item as BarClass)
        },
        contentMore: () => {
          this.moreFn()
        }
      })
    }

    //整个页面的坐标
    .translate({ x: this.IndexX })
  }
}

