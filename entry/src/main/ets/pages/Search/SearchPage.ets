import { router } from '@kit.ArkUI'
import { UserInfo, UserInfoModel } from '../../models/user'
import { LOADING_ChatDetail } from '../../router/Index'
import { Tiktok } from '../../utils/setting'

interface routerParamsName {
  name: string
}

/**
 * 获取路由传的参数*/
const getParams = () => router.getParams() as routerParamsName

@Entry
@Component
struct SearchPage {
  @State
  userList: UserInfo[] = []
  @State
  @Watch('updateFilterList')
  searchName: string = ''
  @State
  filterList: UserInfoModel[] = []
  @State
  isMsg: boolean = false
  @State
  searchValue: string = getParams().name

  aboutToAppear(): void {
    this.getUserList()

  }

  /*
   * 获取用户列表*/
  getUserList() {
    this.userList = new Tiktok(getContext()).getTikTokConnect()
    this.updateFilterList()
  }

  /*
   *更新筛选列表*/
  updateFilterList() {
    if (this.searchName) {
      this.filterList = this.userList.filter(item => item.username.includes(this.searchName))
      return
    }
    this.filterList = [] //列表为空
  }

  build() {
    Column() {
      //搜索框
      Row({ space: 10 }) {
        Search({ placeholder: this.searchValue, value: $$this.searchName })
          .caretStyle({ color: Color.Red })
          .border({
            radius: 8
          })
          .width('85%')
          .backgroundColor('#ffececec')
        Row() {
          Text('取消')
            .onClick(() => {
              router.back()
            })
            .fontColor(Color.Black)
            .fontSize(20)
            .textAlign(TextAlign.Start)
            .layoutWeight(1)
        }.padding({ left: 10 })

      }.margin({
        top: '15%'
      })
      .width('100%').height(50)

      //内容区域
      //判断接收值渲染相应内容
      if (this.searchValue === '搜索') {
        List({ space: 15 }) {
          ForEach(this.filterList, (item: UserInfo) => {
            ListItem() {
              Row({ space: 10 }) {
                Image(item.avatar).width(70).height(70).border({ radius: 35 })
                Row() {
                  Column() {
                    Text(item.username).fontWeight(600).fontSize(24)
                    Text(item.content)
                  }.width('100%').alignItems(HorizontalAlign.Start)
                }

              }.width('100%')
            }.layoutWeight(1)
            .onClick(() => {
              router.pushUrl({
                url: LOADING_ChatDetail,
                params:item
              })
            })
          })

        }.scrollBar(BarState.Off).margin({ top: 20, left: 10, right: 15 })

      }

    }.padding({ left: 20, right: 20 }).width('100%').height('100%').backgroundColor(Color.White)
  }
}

export { SearchPage }