import { sideData } from '../models'

@Component
struct sidebar {
  sideDataList:sideData[]=[
    {
      id:1,
      imgUrl:$r('app.media.love'),
      loveNum:2010
    },
    {
      id:2,
      imgUrl:$r('app.media.chat'),
      loveNum:1650,

    },
    {
      id:3,
      imgUrl:$r('app.media.collect'),
      loveNum:344
    },
    {
      id:4,
      imgUrl:$r('app.media.transmit'),
      loveNum:568
    },
  ]
  @Builder
  side(item:sideData){
    Column(){
      Image(item.imgUrl)
        .width(50)
        .onClick(() => {
          if(item.id===2){
            this.showDialog=!this.showDialog
          }
        })
      Text(item.loveNum.toString())
        .fontColor(Color.White)
        .fontSize(16)
    }

  }
  @State
  showDialog:boolean=false
  @Builder
  Dialog(){
    Column(){
      Text('4126')
    }
    .width('100%')
    .height('100%')
  }
  build() {
    Column(){
      ForEach(this.sideDataList,(item:sideData)=>{
        this.side(item)
      })

    }
    .bindSheet($$this.showDialog,this.Dialog,{
      height:'65%',
      backgroundColor:'#ffefecec'
    })

  }
}
export { sidebar }