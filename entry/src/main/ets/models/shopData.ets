export interface shopType {
  name: string;
  cover: Resource;
  images: Resource[];
  price: number;
  real_price: number;
  isLowPrice: boolean;
  discount: string;
  sold: number;
}


export const shopData: shopType[] = [
  {
    "name": "Redmi K60狠快狠强，狠旗舰！2023，第一台梦幻手机",
    "cover": $r("app.media.gFour"),
    "images": [$r("app.media.gFour"), $r('app.media.gf_1'), $r('app.media.gf_2'), $r('app.media.gf_3')],
    "real_price": 199.9,
    "price": 2999,
    "isLowPrice": true,
    "discount": "",
    "sold": 967
  },
  {
    "name": "小米笔记本Pro X 14",
    "images": [$r("app.media.gFive"), $r("app.media.gfi_1"), $r("app.media.gfi_2"), $r("app.media.gfi_3"),
      $r("app.media.gfi_4")],
    "cover": $r("app.media.gFive"),
    "real_price": 1559.9,
    "price": 6999,
    "isLowPrice": false,
    "discount": "",
    "sold": 473
  },
  {
    "name": "小米电视6 65\" OLED 65英寸",
    "cover": $r("app.media.gSix"),
    "images": [$r("app.media.gSix"), $r("app.media.gs_1"), $r("app.media.gs_2"), $r("app.media.gs_3"),
      $r("app.media.gs_4")],
    "price": 6699,
    "real_price": 399,
    "isLowPrice": false,
    "discount": "",
    "sold": 863
  },
  {
    "name": "红白撞色条纹软糯针织上衣女2022年秋季新款甜美减龄短款毛衣开衫",
    "cover": $r("app.media.gone"),
    "images": [$r("app.media.gone"), $r("app.media.go_1"), $r("app.media.go_2"), $r("app.media.go_3")],
    "isLowPrice": true,
    "discount": "满4减3",
    "sold": 134,
    "price": 39.9,
    "real_price": 9.9
  },
  {
    "name": "森马t恤男2023男士纯棉上衣白色情侣装凉感短袖打底衫纯色体恤潮",
    "images": [$r("app.media.gTwo"), $r("app.media.gt_1"), $r("app.media.gt_2"), $r("app.media.gt_3")],
    "cover": $r("app.media.gTwo"),
    "real_price": 9.9,
    "price": 49.99,
    "isLowPrice": false,
    "discount": "满20减5",
    "sold": 3314
  },
  {
    "name": "ins潮牌长袖t恤男宽松纯色内搭上衣潮牌百搭秋冬季潮流帅气打底衫",
    "cover": $r("app.media.gThree"),
    "images": [$r("app.media.gThree"), $r("app.media.gth_1"), $r("app.media.gth_2"), $r("app.media.gth_3"),
      $r("app.media.gth_4")],
    "real_price": 9.9,
    "price": 22.9,
    "isLowPrice": true,
    "discount": "满10减3",
    "sold": 129
  }
]

export interface BuyTitle {
  name: string
}

export const BuyTitleInfo: BuyTitle[] = [
  { name: '进店' },
  { name: '客服' },
  { name: '购物车' }
]