import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { display, window } from '@kit.ArkUI';
import { Tiktok } from '../utils/setting';
import { CURRENT_USER } from '../constants';
import { LOADING_INDEX } from '../router/Index';


export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    /**
     * 获取声明窗口*/
    const win = windowStage.getMainWindowSync()
    /**
     * 安全区域高度*/
    const areaHeight: number = px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      .topRect.height)
    /**
     * 屏幕宽度*/
    const screenWidth: number = px2vp(display.getDefaultDisplaySync().width)
    //标签按钮宽度
    let btnTitleWidth: number = 0

    AppStorage.setOrCreate("SCREEN_WIDTH", screenWidth)
    AppStorage.setOrCreate("BTN_TITLE_WIDTH", btnTitleWidth)
    AppStorage.setOrCreate('AREA_HEIGHT', areaHeight)
    win.setWindowLayoutFullScreen(true) //设置窗口全屏
    //获取用户信息
    const info = new Tiktok(this.context).getCurrentUser()
    //创建存储用户信息的空间
    AppStorage.setOrCreate(CURRENT_USER, info)
    //加载内容
    windowStage.loadContent(LOADING_INDEX)

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
