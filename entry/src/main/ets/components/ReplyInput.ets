import { Constants } from '../common'
import { Fn } from '../pages/Index/Index'

/**
 * 发布评论组件*/
@Preview
@Component
struct ReplyInput {
  @State
  content: string = '' //输入框内容
  publishComment: (content: string) => void = () => {}
  iptContent: string = ''

  build() {
    Row({ space: 10 }) {
      TextInput({ placeholder: this.iptContent, text: $$this.content })
        .textAlign(TextAlign.Center)
        .layoutWeight(1)
        .height(40)
        .borderRadius(40)//键盘回车事件
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
    .width('95%')
    .height(40)
    .borderRadius(20)
    .backgroundColor('#fff3f3f3')
  }
}

export { ReplyInput }