import { tipDialog } from '../../common/Function/commonFn'
import { DataSource, shopData, shopType } from '../../models'
import { ImgComp } from '../../components'
import { router } from '@kit.ArkUI'
import { Constants } from '../../common'

/**
 * 商品页*/
@Entry
@Component
struct ShopPage {
  @State
  loading: boolean = false //加载的激活条件

  //加载更多数据
  loadMore() {
    return new Promise<boolean>((resolve) => {
      setTimeout(() => {
        this.shopDataInfo.pushArrayData(shopData, false, 0, 6)
        resolve(true)
      }, 500)
    })
  }

  @Builder
  getFooter() {
    Row({ space: 4 }) {
      Text('数据加载')
      LoadingProgress()
        .width(24).height(24)
    }.width('100%')
    .height(60).justifyContent(FlexAlign.Center).margin({ bottom: 40 })
  }

  //商品结构
  @Builder
  waterFlowItem(item: shopType, index: number) {
    shopComp({ item, index })
  }

  private shopDataInfo = new DataSource(shopData)
  @State isRefreshing: boolean = false

  @Builder
  DownBuilder() {
    Row() {
      Text('下拉刷新')
        .fontSize(24)
      LoadingProgress()
        .height(30)
    }
  }

  build() {
    Refresh({ refreshing: $$this.isRefreshing, builder: this.DownBuilder() }) {
      Column() {
        Search({ placeholder: '15pro max美版全新' })
          .width('90%')
          .height(40)
          .border({
            color: Color.Red,
            width: 2,
            radius: 10
          })
          .margin({ top: -10 })
        //渲染商品列表数据
        WaterFlow({ footer: this.getFooter() }) {
          LazyForEach(this.shopDataInfo, (item: shopType, index: number) => {
            FlowItem() {
              this.waterFlowItem(item, index)
            }
            .backgroundColor(Color.White)
            .border({
              radius: 15
            })
          })
        }
        //到底部时触发
        .onReachEnd(async () => {
          //阀门控制
          if (!this.loading) {
            this.loading = true //开启加载
            await this.loadMore() //加载数据
            this.loading = false
          }
        })
        .backgroundColor('#ffe2e2e2')
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .height('100%')
        .nestedScroll({
          scrollForward: NestedScrollMode.PARENT_FIRST,
          scrollBackward: NestedScrollMode.SELF_FIRST
        })
        .padding(10)
      }
      .margin({ top: 100 })
    }.width('100%')
    .height('100%').backgroundColor('#ffe2e2e2')
    .onRefreshing(() => {
      setTimeout(() => {
        this.isRefreshing = false
        tipDialog('刷新完成,该页面都是重复数据', 1500, Alignment.Top)
      }, 500)
    })
  }
}

@Reusable
@Component
struct shopComp {
  @Require
  @Prop
  item: shopType
  index: number = 0

  build() {
    Column({ space: 10 }) {
      ImgComp({
        imgWidth: '100%',
        imgSrc: this.item.cover
      })
        .height(this.index % 2 ? 180 : 200)
        .borderRadius({
          topLeft: 15, topRight: 15
        })
      Column() {
        Text(this.item.name)
        Row({ space: 5 }) {
          //价格
          Text(`￥${this.item.price.toString()}`)
            .fontColor(Color.Red).fontSize(16)
            .fontWeight(600)
          //已售
          Text(`已售${this.item.sold.toString()}`)
            .fontColor('#ff696868').fontSize(14)
        }
        .width('100%')
        .padding({
          left: 0,
          top: 10
        })
      }.margin(10)
    }.onClick(() => {
      router.pushUrl({
        url: Constants.SHOP_DETAIL,
        params: this.item
      })
    })
  }
}

export default ShopPage