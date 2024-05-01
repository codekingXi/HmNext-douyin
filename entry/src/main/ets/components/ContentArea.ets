import { Sidebar } from './SideBar'
import { TopNav } from './TopNav'
import { videoPage } from './VideoCom'

@Component
struct ContentArea {
  build() {
    Column(){
      TopNav()
      Sidebar()
        .zIndex(2).position({
        x:'85%',
        y:'50%'
      })
    }
  }
}
export { ContentArea }