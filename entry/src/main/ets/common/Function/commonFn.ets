/*
 * 公共方法类库*/
import { promptAction, router } from '@kit.ArkUI'

/**
 * 提示弹窗
 * @param {String} msg
 * @param msg 传入需要的提示信息
 * @return {Function} 返回一个弹窗信息*/
export const tipDialog = (msg: string = "功能未完善") => {
  if(msg===null){
    return
  }else
  promptAction.showToast({ message: msg })
}

export default class commonFn {
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

  /**
   * 文本提示弹窗*/
}