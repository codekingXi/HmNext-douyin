@Preview
@Component
struct ReplyInput {

  @State
  content:string='' //输入框内容
  publishComment:(content:string)=>void=()=>{}
  build() {
    Row({space:10}){
      TextInput({placeholder:'~请输入留言',text:$$this.content})
        .layoutWeight(1)
        .height(40)
        .borderRadius(40)
        //键盘回车事件
        .onSubmit(()=>{
          if(this.content){
            this.publishComment(this.content)
            this.content=''
          }
        })
      Button('发送')
        .onClick(()=>{
          if(this.content){
            this.publishComment(this.content)
            this.content=''
          }
        })

    }
    .padding({
      left:10,right:10
    })
    .width('100%')
    .height(60)
  }
}
export { ReplyInput }