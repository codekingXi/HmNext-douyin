/**
 * 全局buiDer*/
@Builder
function CardBuiDer() {
  Column() {
    Column() {

    }
    .width('100%')

  }
  .padding({ left: 15, right: 15 })
  .backgroundColor(Color.White)
  .width('100%')
}

export let Card: WrappedBuilder<[string, number]> = wrapBuilder(CardBuiDer)

