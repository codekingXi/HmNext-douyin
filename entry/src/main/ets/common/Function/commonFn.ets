/*
 * 公共方法类库*/
import { promptAction } from '@kit.ArkUI'
import { Constants } from '../Constants'

/**
 * 提示弹窗
 * @param {String} msg传入需要的提示信息
 * @default 默认值:功能未完善
 * @return {Function} 返回一个弹窗信息*/
const showToast =
  (msg: string = "功能未完善", bgColor: ResourceColor = Constants.COLOR_GREY, time?: number, offset?: Offset,
    Alm?: Alignment) => {
    promptAction.showToast({
      message: msg,
      backgroundColor: bgColor,
      textColor: Color.White,
      duration: time ? time : 1500,
      backgroundBlurStyle: BlurStyle.NONE,
      alignment: Alm,
      offset: offset
    })
  }

/**
 * 推荐页视频控制器*/
const VideoCtl: VideoController = new VideoController()


class commonFn {
  /**
   * 生成11位数的抖音号
   * @param n 最小值
   * @param m 最大值
   * */
  static creteRandom(n: number = 9999999999, m: number = 10000000000): number {
    return Math.floor(Math.random() * (m - n + 1)) + m
  }

  /**
   * 生成固定范围类的随机数
   * @param n 最小值
   * @param m 最大值*/
  static creteUserID(n: number, m: number): number {
    return Math.floor(Math.random() * (n + 1)) + m
  }
}

export { showToast as tipDialog, VideoCtl, commonFn }