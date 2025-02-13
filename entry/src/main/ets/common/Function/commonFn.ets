/*
 * 公共方法类库*/
import { promptAction } from '@kit.ArkUI'
import { cities } from '../../models'
import { Constants } from '../Constants'
import { util } from '@kit.ArkTS'


/**
 * 提示弹窗
 * @param {String} msg传入需要的提示信息
 * @default 默认值:功能未完善
 * @return {Function} 返回一个弹窗信息*/
const showToast =
  (message: string = "功能未完善", time?: number, alignment?: Alignment,
    backgroundColor: ResourceColor = Constants.COLOR_DIALOG_BG, offset?: Offset
  ) => {
    promptAction.showToast({
      message,
      backgroundColor,
      textColor: Color.White,
      duration: time ? time : 1500,
      backgroundBlurStyle: BlurStyle.NONE,
      alignment,
      offset:offset?offset:{dx:null,dy:200}
    })
  }

class commonFn {

  getJsonFileData(path: string) {
    return new util.TextDecoder().decodeToString(getContext().resourceManager.getRawFileContentSync(path))
  }

  /**
   * 获取随机地名*/
  getRandomCity() {
    const randomIndex = Math.floor(Math.random() * cities.length)
    return cities[randomIndex]
  }

  /**
   * 随机点赞量*/
  getRandomLikes() {
    const randomLikes = Math.floor(Math.random() * 10000)
    return randomLikes
  }

  /**
   * 生成11位数的抖音号
   * @param n 最小值
   * @param m 最大值
   * */
  creteRandom(n: number = 9999999999, m: number = 10000000000): number {
    return Math.floor(Math.random() * (m - n + 1)) + m
  }

  /**
   * 生成固定范围类的随机数
   * @param n 最小值
   * @param m 最大值*/
  creteUserID(n: number, m: number): number {
    return Math.floor(Math.random() * (n + 1)) + m
  }
}

const common = new commonFn()

export { showToast as tipDialog, common }