import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { display, KeyboardAvoidMode, window } from '@kit.ArkUI';
import { Tiktok } from '../utils/setting';
import { CURRENT_USER } from '../constants';
import { Constants } from '../common/Constants';


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

    AppStorage.setOrCreate("Screen_width", screenWidth)
    AppStorage.setOrCreate("Btn_title_width", btnTitleWidth)
    AppStorage.setOrCreate('Area_height', areaHeight)
    win.setWindowLayoutFullScreen(true) //设置窗口全屏
    //获取用户信息
    const info = new Tiktok(this.context).getCurrentUser()
    //创建存储用户信息的空间
    AppStorage.setOrCreate(CURRENT_USER, info)
    //加载内容
    await windowStage.loadContent(Constants.LOADING_INDEX)
    //设置键盘避让模式
    windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)

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
