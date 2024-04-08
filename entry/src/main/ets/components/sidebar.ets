import { sideData } from '../models'

@Component
struct sidebar {
  sideDataList:sideData[]=[
    {
      imgUrl:$r('app.media.love'),
      loveNum:2010
    },
    {
      imgUrl:$r('app.media.chat'),
      loveNum:1650
    },
    {
      imgUrl:$r('app.media.collect'),
      loveNum:344
    },
    {
      imgUrl:$r('app.media.transmit'),
      loveNum:568
    },
  ]
  @Builder
  side(item:sideData){
    Column(){
      Image(item.imgUrl)
        .width(50)
      Text(item.loveNum.toString())
        .fontColor(Color.White)
        .fontSize(16)
    }

  }
  build() {
    Column(){
      ForEach(this.sideDataList,(item:sideData)=>{
        this.side(item)
      })

    }
  }
}
export { sidebar }