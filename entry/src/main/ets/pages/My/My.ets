import { BarClass, DataSource, UserInfoModel, mediaInfo } from '../../models'
import { router } from '@kit.ArkUI'
import { Tiktok } from '../../utils/setting'
import { tipDialog } from '../../common'
import { iconBtn, scrollbar, Skeleton } from '../../components'
import { Constants } from '../../common/Constants'
import { personVdDta } from '../../models'

@Component
export default struct My {
  @Consume
  info: UserInfoModel

  aboutToAppear(): void {
    //因为首选项仓库中进行了判断返回不同数据 这里需要重新获取用户信息数据
    this.info = new Tiktok(getContext()).getCurrentUser()
    //重新赋值宽度
    AppStorage.set('Btn_title_width', AppStorage.get('Screen_width') as number / this.personVd.length)
  }

  @Styles
  btnBg(){
    .width(40).height(40).backgroundColor('rgba(48, 48, 48, 0.5)').border({ radius: 40 })
  }

  @Styles
  imgBg(){
    .width(16).height(16)
  }

  @Consume
  showDialog: boolean
  @Consume
  bgColor: ResourceColor
  /**
   * 我的界面顶部信息title*/
  private infoTitle: BarClass[] = [
    { title: '1504', rightContent: '获赞' },
    { title: '46', rightContent: '朋友' },
    { title: '125', rightContent: '关注' },
    { title: '564', rightContent: '粉丝' }
  ]
  /**
   * 我的界面功能区*/
  private personFn: BarClass[] = [
    {
      icon: $r('app.media.icon_shopCar'), title: '抖音商城', click: () => {
      router.pushUrl({
        url: Constants.LOADING_SHOP
      })
    }
    },
    {
      icon: $r('app.media.icon_time'), title: '观看历史', click: () => {
      tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_wallet'), title: '我的钱包', click: () => {
      tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_my_user'), title: '常访问的人', click: () => {
      tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_music'), title: '我的音乐', click: () => {
      tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_applet'), title: '我的小程序', click: () => {
      tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_moreFn'), title: '查看更多', click: () => {
      animateTo({ duration: 200 }, () => {
        this.openRightSideBar()
      })
    }
    }
  ]
  /**
   * 我的界面个人作品区*/
  private personVd: BarClass[] = [
    { title: '作品', id: 1 },
    { title: '私密', id: 2 },
    { title: '推荐', id: 3 },
    { title: '收藏', id: 4 },
    { title: '喜欢', id: 5 }
  ]
  @Consume
  IndexX: number | string
  @State
  private personInfo: ResourceStr | undefined = undefined
  @State
  currentIndex: number = 0
  /**
   * 按钮标签宽度*/
  @State
  btnTitleWidth: number = 0
  tabController: TabsController = new TabsController()

  @Builder
  personBtn(item: BarClass, index: number) {
    Column() {
      Text(item.title)
        .width(AppStorage.get('Btn_title_width'))
        .textAlign(TextAlign.Center)
        .animation({ duration: 200 })
        .fontSize(this.currentIndex === index ? 22 : 16)
        .fontColor(this.currentIndex === index ? Color.Black : '#ff666666')
    }
    .onClick(() => {
      const index = this.personVd.findIndex(obj => obj.title === item.title)
      this.tabController.changeIndex(index)
    })
  }

  /**
   * 获得x坐标*/
  getX() {
    /**
     * 剩余宽度*/
    const X = AppStorage.get('Btn_title_width') as number / 3 - 5
    /**
     * 索引*/
    const id = this.currentIndex + 1
    //返回坐标长度
    return id === 1 ? 20 : AppStorage.get('Btn_title_width') as number * (id - 1) + X
  }

  /**
   * 打开右侧边栏*/
  openRightSideBar() {
    this.showDialog = true
    this.bgColor = Constants.COLOR_OpacityBlack
    this.IndexX = '-65%'
  }

  /**
   * 滚动条控制器
   * */
  scroll: Scroller = new Scroller()

  build() {
    if (this.info!) {
      Scroll() {

        //把上下两个模块包在一起
        Column() {
          //顶部背景区
          Stack() {
            //右侧按钮
            Stack() {
              Row({ space: 20 }) {
                Row({ space: 5 }) {
                  Image($r("app.media.icon_connect"))
                    .imgBg()
                  Text("新访客1").fontSize(14).fontColor(Color.White)
                }.btnBg().width(90).justifyContent(FlexAlign.Center)
                .onClick(() => {
                  tipDialog()
                })

                //搜索和功能按钮区
                Row({ space: 10 }) {
                  Row() {
                    Image($r("app.media.icon_search")).width(28).height(28)
                  }.btnBg().justifyContent(FlexAlign.Center)
                  .onClick(() => {
                    tipDialog()
                  })

                  Row() {
                    Image($r("app.media.icon_Tab")).imgBg()

                  }.btnBg().justifyContent(FlexAlign.Center)
                  .onClick(() => {
                    animateTo({ duration: 200 }, () => {
                      this.openRightSideBar()
                    })
                  })
                }

              }
              .width('100%').height(50).justifyContent(FlexAlign.End).margin({ top: 10, right: 15 })
            }.width('100%').height('50%').zIndex(3).position({ y: 0 })

            Stack({ alignContent: Alignment.BottomStart }) {
              Row() {
                //背景视频
                Video({
                  src: 'https://v1.kwaicdn.com/ksc2/NcKwArc6Icb5FtM__mLH7yIXcGMT8VdgqZwh0y8XdnhdMifsiOJoGDui50LTSWSVz0yfU8-eSGb6MLUXQ-XIzqZM3MajJYtZ_9sKEEA2wZkTFsJJ5531HGLO8ReAUWP3ilECPqdhWcxtTWrXpndBfkAH21UwwWPbM10CiLD5PIp2NcsfJeg7C1Afv9jYhcL5.mp4?pkey=AAW0sM4og4cgWE4srPPimT76JzbASCdEZQI0iJhZujR9aT7Ta1JuzhgQqkCNlzYJOXWik1Gm1NCl2NmjWylzhdU2EdQEZw_PCWek54CT_B5TXLJSeBxXwo-iYhxQAe3YNHU&tag=1-1720429371-unknown-0-lx5gpoy1w5-8a45ccb1560e6069&clientCacheKey=3xixmdt8qzd8gqs_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=10004&tt=b&ss=vp'
                })
                  .layoutWeight(1)
                  .height('150%')
                  .vdSty()
              }

              Row() {
                Row({ space: 20 }) {
                  Row() {
                    //头像
                    Image(this.info.avatar)
                      .width(100).height(100)
                      .border({
                        width: 3,
                        color: Color.White,
                        radius: 50
                      })
                      .onClick(() => {
                        //打开自定义弹窗
                        this.showDialog = true
                        this.bgColor = Color.Black
                      })
                  }

                  Column({ space: 5 }) {
                    Text(this.info.username).fontColor(Color.White)
                    Text(`抖音号:${this.info.tiktokNub}`)
                      .fontColor(Color.Gray)
                      .fontSize(16)
                  }.width('100%').alignItems(HorizontalAlign.Start)

                }.margin({ left: 20 })
              }
              .width('100%').height('50%').linearGradient({
                direction: GradientDirection.Top, //渐变方向
                colors: [['rgba(7, 7, 7, 0.7)', 0.4], ['rgba(78, 77, 77, 0)', 1]]
              })
            }
          }.layoutWeight(3.5).width('100%').margin({ bottom: -10 })

          //白色个人内容区
          Column() {
            //顶部个人信息
            Row({ space: 20 }) {
              ForEach(this.infoTitle, (item: BarClass) => {
                Row({ space: 5 }) {
                  Text(item.title).fontWeight(600).fontSize(20)
                  Text(`${item.rightContent}`).fontSize(16).fontColor(Color.Gray)
                }.onClick(() => {
                  tipDialog()
                })
              })
            }.width('100%')
            .padding(15)

            //个人介绍
            Row() {
              Text(this.personInfo === undefined ? 'I‘m form UK❥(^_-)' : this.personInfo).fontSize(14)
                .fontColor(Color.Black).textAlign(TextAlign.Start)
            }.width('100%').padding(10)

            //功能区
            List({ space: 30, scroller: this.scroll }) {
              ForEach(this.personFn, (item: BarClass) => {
                ListItem() {
                  iconBtn({ icon: item.icon, title: item.title })
                    .onClick(() => {
                      item.click && item.click()

                    })
                }
              })
            }
            .edgeEffect(EdgeEffect.None)
            .listDirection(Axis.Horizontal)
            .padding(20)
            .scrollBar(BarState.Off)
            .height(100)

            //滑动条
            scrollbar({ scroller: this.scroll })

            Stack() {
              Tabs({ controller: this.tabController, barPosition: BarPosition.Start, index: $$this.currentIndex }) {
                ForEach(this.personVd, (item: BarClass) => {
                  TabContent() {
                    if (item.id === 1) {
                      personAreaVdCmt()
                    } else if (item.id === 2) {

                    } else if (item.id === 3) {

                    } else if (item.id === 4) {

                    } else if (item.id === 5) {

                    }
                  }
                })
              }

              //自定义tab栏
              Row() {
                ForEach(this.personVd, (item: BarClass, index: number) => {
                  this.personBtn(item, index)
                })
              }.width('100%')
              .height(50)
              .position({ x: 0, y: 0 })
              .justifyContent(FlexAlign.SpaceAround)

              //下划线
              Divider()
                .strokeWidth(2.5)
                .width(AppStorage.get('Btn_title_width'))
                .color(Color.Black)
                .translate({
                  x: this.getX()
                })
                .position({ x: '-5%', y: 52 })
                .animation({ duration: 200 })
            }
          }
          .layoutWeight(6.5)
          .width('100%')
          .border({
            color: Color.White
          })
          .borderRadius({
            topLeft: 15, topRight: 15
          })
          .backgroundColor(Color.White)
        }
      }
      .scrollBar(BarState.Off)
      .height('120%')
      //修改整个页面的坐标
      .onClick(() => {
        animateTo({ duration: 200 }, () => {
          if (this.IndexX === '-65%') {
            this.IndexX = '0%'
          }
        })
      })
    } else {
      Skeleton({
        showAvatar: true,
        count: 4
      })
    }
  }
}

/**
 * 个人视频区组件*/
@Component
struct personAreaVdCmt {
  private videoData = new DataSource<mediaInfo>(personVdDta) //简化代码不写完整格式

  build() {
    Column() {
      WaterFlow() {
        LazyForEach(this.videoData, (item: mediaInfo) => {
          FlowItem() {
            Video({
              src: item.src
            }).vdSty()
          }
          .height(150)
          .border({
            color: Color.White,
            width: .5
          })
          .onClick(() => {
            router.pushUrl({
              url: Constants.LOADING_VdDETAIL, //视频详情页
              params: item
            })
          })
        })
      }.columnsTemplate('1fr 1fr 1fr')
      .scrollBar(BarState.Off)
    }

  }
}

/**
 * 视频样式*/
@Extend(Video)
function vdSty() {
  .muted(true)
  .loop(true)
  .autoPlay(true)
  .controls(false)
}