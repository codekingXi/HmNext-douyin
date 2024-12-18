import { Constants } from "../common"
import { DataSource, mediaInfo } from "../models"
import { router } from "@kit.ArkUI"

/**
 * 视频栅格化组件*/
@Component
export struct VideoGrid {
  data: object[] = []

  build() {
    Column() {
      if (this.data) {
        WaterFlow() {
          LazyForEach(new DataSource<mediaInfo>(this.data as mediaInfo[]), (item: mediaInfo) => {
            FlowItem() {
              Video({
                src: item.src
              }).vdSty()
            }.height(150)
            .border({
              color: Color.White,
              width: .5
            })
            .onClick(() => {
              router.pushUrl({
                url: Constants.LOADING_VdDETAIL,
                params: item
              })
            })
          })
        }.columnsTemplate('1fr 1fr 1fr')
        .scrollBar(BarState.Off)
      } else {
        Column() {
          Text("空空如也~").fontSize(30).fontColor(Color.Gray)
        }.width('100%').height('100%').justifyContent(FlexAlign.Start).padding({ top: 80 })
      }
    }.layoutWeight(1)
  }
}

@Extend(Video)
function vdSty() {
  .muted(true)
  .loop(true)
  .autoPlay(true)
  .controls(false)
}