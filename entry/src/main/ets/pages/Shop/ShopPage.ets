import goods from '../../common/data/goods.json'
import { promptAction } from '@kit.ArkUI'
import { tipDialog } from '../../common/Function/commonFn'
import { DataSource } from '../../models'
import { ImgComp } from '../../components'

/**
 * 商品页*/
@Entry
@Component
export default struct ShopPage {
  @State
  loading: boolean = false //加载的激活条件

  //加载更多数据
  loadMore() {
    return new Promise<boolean>((resolve, reject) => {
      setTimeout(() => {
        //goods.pushData(...goods.push(0,9)) //es6的方法
        resolve(true)
      }, 1000)
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
  waterFlowItem(index: number) {
    Column({ space: 10 }) {
      ImgComp({
        imgWidth:'100%',
        imgSrc:`/common/images/goods/${goods[index].cover}`
      })
        .height(index % 2 ? 180 : 200)
        .borderRadius({
          topLeft: 15, topRight: 15
        })
      Column() {
        Text(goods[index].name)
        Row({ space: 5 }) {
          //价格
          Text(`￥${goods[index].price.toString()}`)
            .fontColor(Color.Red).fontSize(16)
            .fontWeight(600)
          //已售
          Text(`已售${goods[index].sold.toString()}`)
            .fontColor('#ff696868').fontSize(14)
        }
        .width('100%')
        .padding({
          left: 0,
          top: 10
        })
      }.margin(10)
    }
    .onClick(() => {
      tipDialog()
    })
  }

  private shopData = new DataSource(goods)

  build() {
    Column() {
      Column() {
        Search({ placeholder: '15pro max美版全新' })
          .width('90%').height(40).border({
          color: Color.Red,
          width: 2,
          radius: 10
        }).margin({ top: -10 })
        //渲染商品列表数据
        WaterFlow({ footer: this.getFooter() }) {
          LazyForEach(this.shopData, (item: string, index: number) => {
            FlowItem() {
              this.waterFlowItem(index)
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
            try {
              this.loading = true //开启加载
              await this.loadMore() //加载数据
              this.loading = false
            } catch (e) {
              promptAction.showToast({ message: JSON.stringify(e) })
            }
          }
        })
        .backgroundColor('#ffe2e2e2')
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .padding(10)
      }
      .margin({ top: 100 })

    }.width('100%')
    .height('100%').backgroundColor('#ffe2e2e2')
  }
}

