import { router } from '@kit.ArkUI'

@Component
struct My {
  build() {
    Column(){
      Text('登录')
      Row(){
        Button('前往登录')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/My/Login/Login'
            })
          })
      }
    }.width('100%').height('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)
  }
}
export default My