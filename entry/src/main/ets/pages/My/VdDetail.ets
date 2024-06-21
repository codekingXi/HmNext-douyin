import { Sidebar } from '../../components/SideBar'
import { promptAction, router } from '@kit.ArkUI'
import { COLOR_WHITE } from '../../common/color/colors'
import { mediaInfo, personVdDta } from '../../models/mediaData'

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
  @State
  vdSrc: string = getParams().src

  build() {
    Swiper() {
      ForEach(personVdDta, (item: mediaInfo) => {
        Column() {
          Video({
            src: item.src
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
      })
    }.vertical(true)
    .indicator(false)
  }
}

@Extend(Video)
function vd() {
  .autoPlay(true)
  .loop(true)
  .controls(false)
}