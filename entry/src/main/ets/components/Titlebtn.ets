@Component
export struct TitleBtn {
  title: string=''
  borBom: boolean=false
  click: () => void = ()=>{}
  build() {
    Row() {
      Text(this.title).fontSize(20)
        .fontColor(Color.White)
    }
    .width('90%')
    .height(50)
    .justifyContent(FlexAlign.Start)
    .padding({ left: 10, right: 10 })
    .border({
      width: {
        bottom: this.borBom === true ? .5 : 0
      },
      color: '#ff868686'
    })
    .stateStyles({
      normal:{
        .backgroundColor('#ff3e3e3e')
      },
      pressed:{
        .backgroundColor('#ff53ee38')
      }
    })
    .onClick(() => {
       this.click()
    })
  }
}