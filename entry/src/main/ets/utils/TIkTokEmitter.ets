import { emitter } from '@kit.BasicServicesKit'
import { Constants } from '../common'

/**
 * 事件库*/
export class TikTokEmitter {
  /**
   * 发送播放事件
   * @param {Boolean} value true 播放 false 暂停
   * */
  static Emitter_VideoCrl = (value: boolean) => {
    return value ? emitter.emit(Constants.GLOBAL_VIDEO_CONTROLLER_PLAYER) :
    emitter.emit(Constants.GLOBAL_VIDEO_CONTROLLER_PAUSE)
  }
}