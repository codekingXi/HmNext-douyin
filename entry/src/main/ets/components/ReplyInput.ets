import { Fn } from '../pages/Index/Index'

/**
 * 发布评论组件*/
@Preview
@Component
struct ReplyInput {
  @State
  content: string = '' //输入框内容
  publishComment: (content: string) => void = () => {
  }
  iptContent: string = ''

  build() {
    Row() {
      TextInput({ placeholder: this.iptContent, text: $$this.content })
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(45)
        .borderRadius(40)
        .onSubmit(() => {
          if (this.content) {
            this.publishComment(this.content)
            this.content = ''
          }
        })
        .onClick(() => {
          if (this.iptContent === '善语结善缘,恶言伤人心') {
            Fn.redirect()
          }
        })
    }
    .width('100%')
    .padding({ top: 20 })
    .margin({ bottom: 30 })
    .height(50)
    .justifyContent(FlexAlign.Center)
    .border({
      width: {
        top: .5
      },
      color: Color.Gray
    })
  }
}

export { ReplyInput }