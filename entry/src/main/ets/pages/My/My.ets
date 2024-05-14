import { UserInfo, UserInfoModel } from '../../models'
import { TOKEN_KEY } from '../../constants'

@Preview
@Component
export default struct My {
  @State
  userInfo: UserInfoModel = new UserInfoModel({} as UserInfo)
  getUserInfo(){
    this.userInfo = AppStorage.get(TOKEN_KEY)as UserInfoModel
  }
  aboutToAppear(): void {
    this.getUserInfo()
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
                  Text(`${this.userInfo.username}`).margin({left:-50}).fontColor(Color.White)
                  Text(`抖音号: ${this.userInfo.tiktokNub}`)
                    .onClick(()=>{
                      AlertDialog.show({message:JSON.stringify(this.userInfo)})
                    })
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

    }
    //修改整个页面的坐标
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



