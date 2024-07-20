import goods from '../../common/data/goods.json'
import { promptAction } from '@kit.ArkUI'
import commonFn from '../../common/Function/commonFn'

/**
 * 商品页*/
@Entry
@Component
export default struct Shop {
  @State
  loading: boolean = false //加载的激活条件

  //加载更多数据
  loadMore() {
    return new Promise<boolean>((resolve, reject) => {
      setTimeout(() => {
        goods.push(...goods) //es6的方法
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
      Image(`/common/images/goods/${goods[index].cover}`)
        .objectFit(ImageFit.Cover)
        .height(index % 2 ? 180 : 200)
        .draggable(false)
      Column() {
        Text(goods[index].name)
        Row({ space: 10 }) {
          //价格
          Text(`￥${goods[index].price.toString()}`)
            .fontColor(Color.Red).fontSize(16)
          //已售
          Text(`已售${goods[index].sold.toString()}`)
            .fontColor('#ff696868').fontSize(14)
        }.width('100%').padding({
          left: 10,
          right: 10
        })
      }
    }
  }

  build() {
    Column() {
      Column() {
        Search({ placeholder: '15pro max美版全新' })
          .width('90%').height(40).border({
          color: Color.Red,
          width: 2,
          radius: 10
        }).margin({ top: -20 })
        //渲染商品列表数据
        WaterFlow({ footer: this.getFooter() }) {
          ForEach(goods, (item: string, index: number) => {
            FlowItem() {
              this.waterFlowItem(index)
            }.width('100%')
            .backgroundColor(Color.White)
            .border({
              radius: 8
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
        .onClick(() => {
          commonFn.tipDialog()
        })
      }
      .margin({ top: 100 })

    }.width('100%')
    .height('100%').backgroundColor('#ffe2e2e2')
  }
}