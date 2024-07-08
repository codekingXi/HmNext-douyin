import { BarClass, DataSource, UserInfoModel } from '../../models'
import { promptAction, router } from '@kit.ArkUI'
import { Tiktok } from '../../utils/setting'
import commonFn from '../../common/Function/commonFn'
import { LOADING_SHOP, LOADING_VdDETAIL } from '../../router/Index'
import { COLOR_BLACK, COLOR_GRAY, COLOR_OpacityBlack, COLOR_WHITE } from '../../common/color/colors'
import { mediaInfo, personVdDta } from '../../models/mediaData'
import { Skeleton } from '../../components'

@Component
export default struct My {
  @Consume
  info: UserInfoModel

  aboutToAppear(): void {
    //因为首选项仓库中进行了判断返回不同数据 这里需要重新获取用户信息数据
    this.info = new Tiktok(getContext()).getCurrentUser()
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
        url: LOADING_SHOP
      })
    }
    },
    {
      icon: $r('app.media.icon_time'), title: '观看历史', click: () => {
      commonFn.tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_wallet'), title: '我的钱包', click: () => {
      commonFn.tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_my_user'), title: '常访问的人', click: () => {
      commonFn.tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_music'), title: '我的音乐', click: () => {
      commonFn.tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_applet'), title: '我的小程序', click: () => {
      commonFn.tipDialog()
    }
    },
    {
      icon: $r('app.media.icon_moreFn'), title: '查看更多', click: () => {
      animateTo({ duration: 200 }, () => {
        this.showDialog = true
        this.bgColor = COLOR_OpacityBlack
        this.IndexX = '-65%'
      })
    }
    }
  ]
  /**
   * 我的界面个人作品区*/
  private personVd: BarClass[] = [
    { title: '作品', id: 1 },
    { title: '私密', id: 2 },
    { title: '收藏', id: 3 },
    { title: '喜欢', id: 4 }
  ]
  @Consume
  IndexX: number | string
  @State
  private personInfo: ResourceStr | undefined = undefined
  @State
  currentIndex: number = 0
  @State
  btnTitleWidth: number = 0
  tabController: TabsController = new TabsController()

  @Builder
  personBtn(item: BarClass) {
    Column() {
      Text(item.title)
        .animation({ duration: 200 })
        .onAreaChange((oldArea, newArea) => {
          this.btnTitleWidth = newArea.width as number
        })
        .fontSize(16)
        .fontColor(this.personVd[this.currentIndex].id === item.id ? COLOR_BLACK : '#ff666666')
        .fontWeight(this.personVd[this.currentIndex].id === item.id ? 500 : 400)
    }
    .onClick(() => {
      const index = this.personVd.findIndex(obj => obj.title === item.title)
      this.tabController.changeIndex(index)
    })
  }

  /**
   * 获得x坐标*/
  getX() {
    if (this.personVd[this.currentIndex].id === 1) {
      return this.btnTitleWidth + 5
    } else if (this.personVd[this.currentIndex].id === 2) {
      return this.btnTitleWidth * 4 + 5
    } else if (this.personVd[this.currentIndex].id === 3) {
      return this.btnTitleWidth * 7 + 5
    } else if (this.personVd[this.currentIndex].id === 4) {
      return this.btnTitleWidth * 10 + 5
    }
    return
  }

  build() {
    if (this.info) {
      Scroll() {
        Column() {
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
                    commonFn.tipDialog()
                  })

                  Row() {
                    Image($r("app.media.icon_search")).width(28).height(28)
                  }.btnBg().justifyContent(FlexAlign.Center)
                  .onClick(() => {
                    commonFn.tipDialog()
                  })

                  Row() {
                    Image($r("app.media.icon_Tab")).imgBg()

                  }.btnBg().justifyContent(FlexAlign.Center)
                  .onClick(() => {
                    animateTo({ duration: 200 }, () => {
                      //显示遮罩
                      this.showDialog = !this.showDialog
                      this.bgColor = COLOR_OpacityBlack
                      //更改移动的坐标位置
                      this.IndexX = '-65%'
                    })

                  })
                }
                .width('100%').height(50).justifyContent(FlexAlign.End).margin({ top: 10, right: 10 })
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
                          this.bgColor = COLOR_BLACK
                        })
                    }

                    Column({ space: 5 }) {
                      Text(this.info.username).fontColor(Color.White)
                      Text(`抖音号:${this.info.tiktokNub}`)
                        .fontColor(COLOR_GRAY)
                        .fontSize(16)
                    }.width('100%').alignItems(HorizontalAlign.Start)

                  }.margin({ left: 20 })
                }
                .width('100%').height('50%').linearGradient({
                  direction: GradientDirection.Top, //渐变方向
                  colors: [['rgba(7, 7, 7, 0.7)', 0.4], ['rgba(78, 77, 77, 0)', 1]]
                })
              }
            }.layoutWeight(2).width('100%').margin({ bottom: -10 })


            //白色个人内容区
            Column() {
              //顶部个人信息
              Row({ space: 20 }) {
                ForEach(this.infoTitle, (item: BarClass) => {
                  Row({ space: 5 }) {
                    Text(item.title).fontWeight(600).fontSize(20)
                    Text(`${item.rightContent}`).fontSize(16).fontColor(COLOR_GRAY)
                  }.onClick(() => {
                    commonFn.tipDialog()
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
              List({ space: 30 }) {
                ForEach(this.personFn, (item: BarClass) => {
                  ListItem() {
                    Column({ space: 10 }) {
                      Image(item.icon).width(32).height(32)
                      Text(item.title)
                    }.onClick(() => {
                      item.click && item.click()
                    })
                  }
                })
              }.listDirection(Axis.Horizontal).padding(20)
              .scrollBar(BarState.Off)
              .height(100)

              Stack() {
                Tabs({ controller: this.tabController, barPosition: BarPosition.Start, index: $$this.currentIndex }) {
                  ForEach(this.personVd, (item: BarClass) => {
                    TabContent() {
                      if (item.id === 1) {
                        personVdCmt()
                      } else if (item.id === 2) {

                      } else if (item.id === 3) {

                      } else if (item.id === 4) {

                      }
                    }
                    .tabBar()
                  })
                }

                Row() {
                  ForEach(this.personVd, (item: BarClass) => {
                    this.personBtn(item)
                  })
                }.width('100%')
                .height(50)
                .position({ x: 0, y: 0 })
                .justifyContent(FlexAlign.SpaceAround)

                Divider()
                  .strokeWidth(2)
                  .width(this.btnTitleWidth * 2)
                  .color(COLOR_BLACK)
                  .translate({ x: this.getX() })
                  .animation({ duration: 200 })
                  .position({ x: '-5%', y: 50 })

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
          }.height('100%')
        }
      }.height('150%')
      .scrollBar(BarState.Off)
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
struct personVdCmt {
  private videoData = new DataSource<mediaInfo>(personVdDta)  //简化代码不写完整格式

  build() {
    Grid() {
      LazyForEach(this.videoData, (item: mediaInfo) => {
        GridItem() {
          Video({
            src: item.src
          })
            .vdSty()
        }
        .onClick(() => {
          router.pushUrl({
            url: LOADING_VdDETAIL, //视频详情页
            params: item
          })
        })
        .width(120)
        .height(150).border({
          color: COLOR_WHITE,
          width: .5
        })
      })
    }
    .columnsTemplate('1fr 1fr 1fr')
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
