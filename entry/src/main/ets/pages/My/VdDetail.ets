/**
 * 因技术原因，暂时只能查看单独视频详情，无法上下切换，因此没有用轮播结构*/

import { Sidebar } from '../../components/SideBar'
import { promptAction, router } from '@kit.ArkUI'
import { COLOR_WHITE } from '../../common/color/colors'

interface vdSrc {
  src: string
  id: number
}

/**
 * 获取传递过来的视频链接*/
const getParams = () => router.getParams() as vdSrc

/**
 * 视频详情页*/
@Entry
@Component
struct VdDetail {
  /**
   * 视频链接
   * 后续可能做删除等操作，因此要用响应式的链接*/
  @State
  vdSrc: string = getParams().src

  build() {
    Column() {
      Video({
        src: this.vdSrc
      })
        .vd()
      Text('<')
        .fontColor(COLOR_WHITE)
        .fontSize(40)
        .position({ x: '5%', y: '5%' })
        .onClick(() => {
          router.back()
        })
      Sidebar().position({ x: '85%', y: '50%' })
    }
  }
}


@Extend(Video)
function vd() {
  .autoPlay(true)
  .loop(true)
  .controls(false)
}