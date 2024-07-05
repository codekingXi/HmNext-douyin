@Preview
@Component
struct Skeleton {
  @Prop
  showAvatar: boolean = true
  @Prop
  count: number = 3
  timer: number = -1
  @State
  currentColor: string = "#f3f4f5"

  aboutToAppear(): void {
    this.timer = setInterval(() => {
      if (this.currentColor === "#f3f4f5") {
        this.currentColor = "#f7f8f9"
      } else {
        this.currentColor = "#f3f4f5"
      }
    }, 100)
  }

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  @Builder
  getSingleItem() {
    Column() {
      Row({ space: 10 }) {
        if (this.showAvatar) {
          Row()
            .width(40)
            .height(40)
            .borderRadius(20)
            .backgroundColor(this.currentColor)
        }
        Column({ space: 10 }) {
          Row()
            .width("30%")
            .height(26)
            .backgroundColor(this.currentColor)
          Row()
            .width("100%")
            .height(26)
            .backgroundColor(this.currentColor)
          Row()
            .width("100%")
            .height(26)
            .backgroundColor(this.currentColor)
          Row()
            .width("50%")
            .height(26)
            .backgroundColor(this.currentColor)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)

      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
    }
    .width('100%')

  }

  build() {
    Column({ space: 30 }) {
      ForEach(Array.from(Array(this.count)), () => {
        this.getSingleItem()
      })
    }
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}

export { Skeleton }