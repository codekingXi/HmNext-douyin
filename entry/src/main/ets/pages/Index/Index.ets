import { BarClass, UserInfo, UserInfoModel } from '../../models'
import { Card, CardItem, customDialog, iconBtn, SideBarCom, TitleBtn, TopBar } from '../../components'
import { promptAction, router } from '@kit.ArkUI'
import My from '../My/My'
import { CURRENT_USER } from '../../constants'
import { Tiktok } from '../../utils/setting'
import { CurrentUser } from '../../models/user'
import { picker } from '@kit.CoreFileKit'
import commonFn from '../../common/Function/commonFn'
import { common } from '@kit.AbilityKit'
import { Message } from '../Message/Message'
import { Constants } from '../../common/Constants'

export const Store = new Tiktok(getContext()).getStore()

/**
 * 功能*/
export class Fn {
  /**路由重定向*/
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
              url: Constants.LOADING_LOGIN
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
  /**
   * 记录返回时间*/
  backTime: number = 0

  onBackPress(): boolean | void {
    let now = Date.now() //获取时间戳
    if (now - this.backTime < 1000) {
      //获取声明公共UI能力上下文方法
      const ctx = getContext(this) as common.UIAbilityContext
      ctx.terminateSelf() //终止程序
    } else {
      this.backTime = now
      promptAction.showToast({
        message: '再按一次退出',
        alignment: Alignment.Top,
        duration: 2000,
        offset: { dx: 0, dy: 250 }
      })
    }
    return true //使用自定义功能而非router
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
  @Provide
  IndexX: number | string = '' //整个index页面的x坐标
  @State
  currentIndex: number = 0
  /**
   * 是否显示弹窗 */
  @Provide
  showDialog: boolean = false
  /**
   * 是否显示上传弹窗*/
  @State
  showUploadDialog: boolean = false
  /**
   * 弹窗的背景色*/
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
          url: Constants.LOADING_SETTING
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
  @State
  CardData: BarClass[] = [
    {
      title: '通知消息',
      id: 1,
    },
    {
      title: '常用小程序',
      id: 2
    },
    {
      title: '常用功能',
      id: 3
    },
    {
      title: '生活动态',
      id: 4
    }
  ]
  /**
   * 常用小程序数据源*/
  @State
  commonlyUsedAppletsItemData: BarClass[] = [
  //   {
  //     icon: $r('app.media.icon_wallet'),
  //     title: '我的钱包',
  //     click: () => {
  //       commonFn.tipDialog()
  //     }
  //   },
  //   {
  //     icon: $r('app.media.icon_leftsider_coupons'),
  //     title: '优惠卷',
  //     click: () => {
  //       commonFn.tipDialog()
  //     }
  //   },
  //   {
  //     icon: $r('app.media.icon_applet'),
  //     title: '小程序',
  //     click: () => {
  //       commonFn.tipDialog()
  //     }
  //   },
  //   {
  //     icon: $r('app.media.icon_time'),
  //     title: '观看历史',
  //     click: () => {
  //       commonFn.tipDialog()
  //     }
  //   }, {
  //   icon: $r('app.media.icon_leftSider_contentLove'),
  //   title: '内容偏好',
  //   click: () => {
  //     commonFn.tipDialog()
  //   }
  // }, {
  //   icon: $r('app.media.icon_clouddownload'),
  //   title: '离线模式',
  //   click: () => {
  //     commonFn.tipDialog()
  //   }
  // }, {
  //   icon: $r('app.media.icon_waitplay'),
  //   title: '稍后再看',
  //   click: () => {
  //     commonFn.tipDialog()
  //   }
  // },
  ]
  /**
   * 常用功能数据源*/
  @State
  commonFnItemData: BarClass[] = [
    {
      icon: $r('app.media.icon_wallet'),
      title: '我的钱包',
      click: () => {
        commonFn.tipDialog()
      }
    }, {
    icon: $r('app.media.icon_leftsider_coupons'),
    title: '优惠卷',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_applet'),
    title: '小程序',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_time'),
    title: '观看历史',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_leftSider_contentLove'),
    title: '内容偏好',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_clouddownload'),
    title: '离线模式',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_waitplay'),
    title: '稍后再看',
    click: () => {
      commonFn.tipDialog()
    }
  },
  ]
  /**
   * 生活动态数据源*/
  @State
  lifeDynamicsItemData: BarClass[] = [
    {
      icon: $r('app.media.icon_siderLeft_live'),
      title: '直播广场',
      click: () => {
        commonFn.tipDialog()
      }
    }, {
    icon: $r('app.media.icon_siderLeft_shopCarperson'),
    title: '附近团购',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_siderLeft_activityCenter'),
    title: '活动中心',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_siderLeft_playGame'),
    title: '玩游戏',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_siderLeft_music'),
    title: '听抖音',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_siderLeft_screeningRoom'),
    title: '放映厅',
    click: () => {
      commonFn.tipDialog()
    }
  }, {
    icon: $r('app.media.icon_siderLeft_singing'),
    title: 'K歌',
    click: () => {
      commonFn.tipDialog()
    }
  },
  ]
  //底部title字体的颜色
  @State
  titleColor: ResourceColor[] = [Color.White, Color.Gray]
  /**
   * 默认提示内容功能*/
  @BuilderParam
  FnTip: (TipContent: string) => void = this.FnTipContent
  /**
   * 提示内容*/
  @State
  TipContent: string = ''

  /**
   * 提示内容功能*/
  @Builder
  FnTipContent(content: string) {
    Row() {
      Text(content)
        .width('100%')
        .fontColor(Color.Red)
        .maxLines(1)
        .fontSize(20)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
    }.padding({ left: 20, right: 20 })
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }

  @Builder
  rightTipContent() {
    Text('>').fontColor(Color.Gray)
      .fontSize(20)
  }

  /**
   * 卡片盒子*/
  @Builder
  CardBox(item: BarClass) {
    Scroll() {
      Card({
        leftTitle: item.title,
        rightTip: () => {
          if (item.id as number < this.CardData.length - 1) {
            this.rightTipContent()
          }
        },
        CardItem: () => {
          //通知消息
          if (item.id === 1) {
            if (this.FnTip) {
              this.FnTip('没有消息')
            }
          }
          //常用小程序
          if (item.id === 2) {
            //没有数据就渲染提示
            if (!this.commonlyUsedAppletsItemData) {
              this.commonlyUsedApplets()
            } else {
              this.FnTip('啥也没有,快去尝鲜吧')
            }

          }
          //常用功能
          if (item.id === 3) {
            this.CommonFn()
          }
          //生活动态
          if (item.id === 4) {
            this.lifeDynamics()
          }
        }
      })
    }.margin({ left: 15 })
  }

  /**
   * 常用小程序*/
  @Builder
  commonlyUsedApplets() {
    Grid() {
      ForEach(this.commonlyUsedAppletsItemData, (item: BarClass) => {
        GridItem() {
          iconBtn({
            icon: item.icon,
            title: item.title
          })
            .onClick(() => {
              item.click && item.click()
            })
        }.margin({ top: 15, bottom: 10 })
      })
    }.columnsTemplate('1fr 1fr 1fr')
  }

  /**
   * 常用功能*/
  @Builder
  CommonFn() {
    Grid() {
      ForEach(this.commonFnItemData, (item: BarClass) => {
        GridItem() {
          iconBtn({
            icon: item.icon,
            title: item.title
          })
            .onClick(() => {
              item.click && item.click()
            })
        }.margin({ top: 15, bottom: 10 })
      })
    }.columnsTemplate('1fr 1fr 1fr')
  }

  /**
   * 生活动态*/
  @Builder
  lifeDynamics() {
    Grid() {
      ForEach(this.lifeDynamicsItemData, (item: BarClass) => {
        GridItem() {
          iconBtn({
            icon: item.icon,
            title: item.title
          })
            .onClick(() => {
              item.click && item.click()
            })
        }.margin({ top: 15, bottom: 10 })
      })
    }.columnsTemplate('1fr 1fr 1fr')
  }

  //右侧侧边栏的结构
  @Builder
  contentItem(item: BarClass) {
    CardItem({
      icon: item.icon,
      leftTitle: item.title,
      rightContent: item.rightContent
    })
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
    }.justifyContent(FlexAlign.Center)
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
      .margin({ top: -20 })
    }
  }

  build() {
    Column() {
      //底部的nav
      Stack({ alignContent: Alignment.Bottom }) {
        Tabs({ index: $$this.currentIndex, controller: this.tabController, barPosition: BarPosition.End }) {
          ForEach(this.btmTabList, (item: BarClass) => {
            TabContent() {
              if (item.name === 'Home') {
                TopBar()
              } else if (item.name === 'Friend') {
                Text('Friend')
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
          ForEach(this.btmTabList, (item: BarClass) => {
            this.bottomBar(item)
          })
        }
        .width('100%')
        .height(75)
        .position({ y: '91.1%' })
        .backgroundColor(Constants.COLOR_GrayNAV)
        .justifyContent(FlexAlign.SpaceAround)

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
                }
              })
            })
        }
      }
      //全屏模态弹窗
      .bindContentCover($$this.showUploadDialog, this.contentDialog, {
        modalTransition: ModalTransition.DEFAULT
      })

      //封装好的侧边栏放在一个位置 方便改内容
      //左侧边栏
      SideBarCom({
        sidePositionX: '-70%',
        itemData: this.CardData,
        contentBox: (item: object) => {
          this.CardBox(item as BarClass)
        },
        sideBgColor: '#ffefefef',
        sideBottom: 0,
        sideLeft: 0,
        sideRight: 0
      })
      //右侧边栏
      SideBarCom({
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

