import { emitter } from '@kit.BasicServicesKit'
import { Constants } from '../common'

/**
 * 事件库*/
export class TikTokEmitter {
  /**
   * 发送播放事件*/
  static Emitter_PlayerVideo = () => emitter.emit(Constants.GLOBAL_VIDEO_CONTROLLER_PLAYER)
  /**
   * 发送暂停时间*/
  static Emitter_PauseVideo = () => emitter.emit(Constants.GLOBAL_VIDEO_CONTROLLER_PAUSE)
}