/*
 * 公共方法类库*/
import { promptAction, router } from '@kit.ArkUI'

export default class commonFn {
  /*
   * create 11 random
   * */
  static creteRandom() {
    //生成11位数的抖音号
    return Math.floor(Math.random() * (99999999999 - 10000000000 + 1)) + 10000000000
  }

  //生成11到200之间的随机数
  static creteUserID() {
    return Math.floor(Math.random() * (11 + 1)) + 100
  }
  /**
   * 文本提示弹窗*/
  static tipDialog(){
    promptAction.showToast({message: "功能未完善"})
  }
  /**
   * 离开页面提示*/
  static tipOutPage(){
    router.showAlertBeforeBackPage({
      message:'确定要退出吗'
    })
  }

}