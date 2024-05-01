import { Sidebar } from './SideBar'
import { topNav } from './topNav'

@Component
struct ContentArea {
  build() {
    Column(){
      topNav()
      Sidebar()
        .zIndex(2).position({
        x:'85%',
        y:'50%'
      })
    }
  }
}
export { ContentArea }