import goods from '../../public/data/goods.json'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
export default struct Shop {
  @Builder
  waterFlowItem(index: number) {
    Column({ space: 10 }) {
      Image(`/public/images/goods/${goods[index].cover}`)
        .height(index % 2 ? 180 : 200)
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
        Row() {
          Search({ placeholder: '15pro max美版全新' })
            .width('90%')
        }
        .height(40).border({
          color: Color.Red,
          width: 2,
          radius: 10
        })

        WaterFlow() {
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
        .backgroundColor('#ffe2e2e2')
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .padding(10)
        .onClick(()=>{
          promptAction.showToast({message:'功能未完善'})
        })
      }
      .margin({ top: 50 })

    }.width('100%')
    .height('100%').backgroundColor('rgba(255, 255, 255, 0.85)')
  }
}