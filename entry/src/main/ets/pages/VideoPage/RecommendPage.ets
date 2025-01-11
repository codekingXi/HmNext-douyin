import { common } from '../../common'
import { VideoComp } from '../../components'
import { DataSource as videoData, mediaType } from '../../models'


/**
 * 推荐页
 * */
@Entry
@Component
struct RecommendPage {
  /**
   * 索引*/
  @Provide
  activeIndex: number = 0
  /**
   * 懒加载视频数据列表*/
  videoList = new videoData<mediaType>(this.getVideoData())

  getVideoData() {
    const data = common.getJsonFileData('videos.json')
    return JSON.parse(data) as mediaType[]
  }

  build() {
    Swiper() {
      LazyForEach(this.videoList, (item: mediaType, index: number) => {
        VideoComp({
          item,
          index
        })
      })
    }
    .index($$this.activeIndex)
    //关闭指示器
    .indicator(false)
    .duration(200)
    .loop(false)
    //允许滚动
    .vertical(true)
  }
}

export default RecommendPage