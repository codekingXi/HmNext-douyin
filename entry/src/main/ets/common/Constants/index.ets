/**
 * 常量库
 * */
export class Constants {
  //统一色值
  /**
   * 弹窗背景色*/
  static readonly COLOR_OpacityBlack = '#80000000'
  /**
   * 灰色*/
  static readonly COLOR_GREY = '#ff868585'
  /**
   * 底部栏背景色*/
  static readonly COLOR_GrayNAV = '#ff393939'
  /**
   * 侧边栏钱包背景色*/
  static readonly COLOR_SiDerPay = 'rgba(227, 227, 227, 0.50)'

  static readonly COLOR_DIALOG_BG = 'rgba(0, 0, 0, 0.50)'
  //统一数值
  static readonly SCREEN_WIDTH = 'SCREEN_WIDTH'
  static readonly BTN_TITLE_WIDTH = 'BTN_TITLE_WIDTH'
  static readonly AREA_HEIGHT = 'AREA_HEIGHT'
  static readonly BOTTOM_HEIGHT = 'BOTTOM_HEIGHT'
  //统一路由管理
  /**
   * 加载登录页*/
  static readonly LOADING_LOGIN = "pages/Login/LoginPage"
  /**
   * 加载主页*/
  static readonly LOADING_INDEX = "pages/Index/Index"
  /**
   * 加载聊天详情页*/
  static readonly LOADING_ChatDetail = "pages/ChatDetail/ChatDetail"
  /**
   * 加载搜索页*/
  static readonly LOADING_SEARCH = "pages/Search/SearchPage"
  /**
   * 加载设置页*/
  static readonly LOADING_SETTING = "pages/Setting/SettingPage"
  /**
   * 加载商品页*/
  static readonly LOADING_SHOP = "pages/Shop/ShopPage"
  /**
   * 加载视频详情页*/
  static readonly LOADING_VdDETAIL = "pages/My/VdDetail"
}