import { BarClass, UserInfo, UserInfoModel } from '../../models'
import { promptAction } from '@kit.ArkUI'
import { SideBarCom } from '../../components'

@Preview
@Component
export default struct My {
  userInfo: UserInfoModel = new UserInfoModel({} as UserInfo)

  @State
  itemData: BarClass[] = [
    {
      icon: $r('app.media.icon_shopCar'),
      title: "我的订单",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    },
    {
      icon: $r('app.media.icon_wallet'),
      title: "我的钱包",
      rightContent: '8.88',
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      }

    },
    {
      icon: $r('app.media.icon_QRcode'),
      title: "我的二维码",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true

    },
    {
      icon: $r('app.media.icon_time'),
      title: "观看历史",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true

    },
    {
      icon: $r('app.media.icon_waitplay'),
      title: "稍后再看",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true

    },
    {
      icon: $r('app.media.icon_clouddownload'),
      title: "离线模式",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    },
    {
      icon: $r('app.media.icon_idea'),
      title: "抖音创作着中心",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      }
    },
    {
      icon: $r('app.media.icon_applet'),
      title: "小程序",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    },
    {
      icon: $r('app.media.icon_love'),
      title: "抖音公益",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    },
    {
      icon: $r('app.media.icon_sapling'),
      title: "青少年模式",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    },
    {
      icon: $r('app.media.icon_service'),
      title: "我的客服",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    },
    {
      icon: $r('app.media.icon_setting'),
      title: "设置",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      }
    },
    {
      icon: $r('app.media.icon_personedetail'),
      title: "个人信息收集清单",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    },
    {
      icon: $r('app.media.icon_share'),
      title: "第三方信息共享清单",
      click:()=>{
        promptAction.showToast({message: "功能未完善"})
      },
      bottomBorder:true
    }
  ]



  //随机的用户id
  randomNum() {
    const Uid = Math.floor(Math.random() * (99999999999 - 10000000000 + 1)) + 10000000000
    return Uid
  }

  aboutToAppear(): void {
    this.userInfo.tiktokNub = this.randomNum()
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
  IndexX:number|string

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
    }.width('100%').height(60).justifyContent(FlexAlign.SpaceBetween)
    .onClick(()=>{
      item.click&&item.click()
    })
    .border({
      width: {
        bottom: item.bottomBorder===true?0:0.5
      }
    })
  }
  build() {
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

              Row() {
                Image($r("app.media.icon_search")).width(28).height(28)
              }.btnBg().justifyContent(FlexAlign.Center)

              Row() {
                Image($r("app.media.icon_Tab")).imgBg()

              }.btnBg().justifyContent(FlexAlign.Center)
              .onClick(() => {
                //更改移动的坐标位置
                this.IndexX='-65%'
              })
            }
            .width('100%').height(50).justifyContent(FlexAlign.End).margin({ top: 10, right: 10 })
          }.width('100%').height('50%').zIndex(3).position({ y: 0 })

          Stack({ alignContent: Alignment.BottomStart }) {
            Row() {
              //背景视频
              Video({
                src: $rawfile("media/myTopBgMedia/Bg-video.mp4")
              })
                .muted(true)
                .loop(true)
                .autoPlay(true)
                .controls(false)
            }

            Row() {
              Row({ space: 20 }) {
                Row() {
                  //头像
                  Image('https://c-ssl.dtstatic.com/uploads/blog/202206/16/20220616151457_21591.thumb.400_0.jpg')
                    .width(100).height(100)
                    .border({
                      width: 3,
                      color: Color.White,
                      radius: 50
                    })
                }

                Column({ space: 5 }) {
                  Text(this.userInfo.username)
                  Text(`抖音号: ${this.userInfo.tiktokNub}`)
                    .fontColor('#ff807f7f')
                    .fontSize(16)
                }
              }.margin({ left: 20 })
            }
            .width('100%').height('50%')
            .linearGradient({
              direction: GradientDirection.Top, //渐变方向
              colors: [['rgba(7, 7, 7, 0.7)', 0.4], ['rgba(78, 77, 77, 0)', 1.0]]
            })
          }.zIndex(2)
        }.layoutWeight(3.5).width('100%')

        //白色个人内容区
        Column() {
          Row() {
            Text('内容').fontColor(Color.Black)
          }
        }
        .width('100%')
        .border({
          color: Color.White
        })
        .borderRadius({
          topLeft: 10, topRight: 10
        })
        .layoutWeight(6.5)
        .backgroundColor(Color.White)
      }

    }//修改整个页面的坐标
    .onClick(()=>{
      if(this.IndexX==='-65%'){
        this.IndexX='0%'
      }
    })
    .animation({
      duration:200,
      iterations:1,
      playMode:PlayMode.Normal

    })
  }
}



