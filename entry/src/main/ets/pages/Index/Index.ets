import { BarClass } from '../../models'
import { window } from '@kit.ArkUI'
import { VideoPage } from '../VideoPage/VideoPage'
import { bottomNav, Sidebar } from '../../components'


@Extend(Text)
function T() {
  .fontColor(Color.White)
  .fontSize(24)
}

@Entry
@Component
struct Index {
  @State
  TopNavList: BarClass[] = [
    {
      id: 0,
      title: "推荐",
      name: "forYou"
    }, {
    id: 1,
    title: "商场",
    name: "shop"
  }
  ]

  async aboutToAppear(): Promise<void> {
    await window.getLastWindow(getContext())
      .then(win => {
        win.setWindowBackgroundColor('#000000');
      })
    this.updateIndex()
  }

  @State
  @Watch("updateIndex")
  currentIndex: number = 0

  updateIndex() {

  }

  @Builder
  Common(item: BarClass) {
    Row() {
      Text(item.title).T()
    }
  }

  build() {
    Column() {
      Tabs({ index: $$this.currentIndex }) { //绑定当前索引
        ForEach(this.TopNavList, (item: BarClass) => {
          TabContent() {
            if (item.name === "shop") {
              Text('Shop')
            } else
              if (item.name === "forYou") {
                VideoPage()
              }
          }
          .tabBar(this.Common(item))
        })
      }.barWidth('40%')

      Sidebar().zIndex(2).position({
        x: '85%',
        y: '50%'
      })
      bottomNav()
    }
  }
}

