import { util } from "@kit.ArkTS"

export interface mediaInfo {
  id?: string
  title?: string
  src: ResourceStr
}

export class mediaInfoModel implements mediaInfo {
  id?: string = ''
  title?: string = ''
  src: ResourceStr = ''

  constructor(model: mediaInfo) {
    this.id = model.id || util.generateRandomUUID()
    this.title = model.title
    this.src = model.src
  }
}

/**
 * 主页视频数据
 * */
export const mediaList: mediaInfo[] = [
  {
    src: 'https://v3-web-prime.douyinvod.com/video/tos/cn/tos-cn-ve-15/ooNBmDJsEACPqmQAwAbEbeRCxIE9g5FRnmB7kf/?a=6383&br=2468&bt=2468&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=101s_100B_100x_100z_100o&cr=3&cs=0&cv=1&dr=0&ds=6&dy_q=1730809719&expire=1730820528&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4SNWjAIMppfttOLJusd.C_bAja-CInwFU2dc6BFRxRmfwGpHDDPXPt-2V5kTtusZ.&is_ssr=1&l=20241105202837687D3E7F4B67A227494A&lr=all&mime_type=video_mp4&ply_type=4&policy=4&qs=0&rc=OTk8OGg1ZDNlMzs6aGhlaEBpMzk2cXI5cm00djMzNGkzM0BeMmEuY2EvNi8xLzYuM2FeYSNmcWFeMmRzNWZgLS1kLS9zcw%3D%3D&signature=ff07b2dda7c0c819801f6139b2120d44&tk=webid&webid=c4683e1a43ffa6bc6852097c712d14b81f04bc9b5ca6d30214b0e66b4e38528070dd6a8f7b681012cfe1119f36411ee6699a15754480952c362189d34307fcd49ae53b9ab4d383e9ea28eb92ed284aeb9f5b38e79ea6b8464123946275bf2632825261df1e88075d1508e7e9fe3f2c0decd3dad70f53f1572b16b0be64146ceca0deb063bd0745d24dc20b158cf4070b0223f1260a2a5422a3cbe22868894a56-badc7c87bffcbb5462746ea318f65d98&fid=e68f4b92601ecfcddefa2571fa2d86f2'
  , id: '1'
  },
  {
    src: 'https://v26-web-prime.douyinvod.com/video/tos/cn/tos-cn-ve-15c000-ce/oEJBJRX8BRArHH14ExeVOeAeUgIh9CGyOgg75L/?a=6383&br=2196&bt=2196&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=101s_100B_100x_100z_100o&cr=3&cs=0&cv=1&dr=0&ds=6&dy_q=1730553493&expire=1730564300&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4SNWjAIMppfttOLJusd.C_bAja-CInJ98Ndc6Bauy1mfwGpHDDMJFktXJCiM4usZ.&is_ssr=1&l=20241102211811CC047E6DB9B5D99B1015&lr=all&mime_type=video_mp4&ply_type=4&policy=4&qs=0&rc=Zmg8OmhlMzM0NTw2aTw4O0BpajQzcXI5cmRvdjMzbGkzNEBeXmBfNWJfXy8xLzZgLzEuYSNuL2VjMmRzaWVgLS1kLWJzcw%3D%3D&signature=b3f72f28bc67af4b7305a5ba1373502a&tk=webid&webid=c4683e1a43ffa6bc6852097c712d14b81f04bc9b5ca6d30214b0e66b4e38528070dd6a8f7b681012cfe1119f36411ee6699a15754480952c362189d34307fcd49ae53b9ab4d383e9ea28eb92ed284aeb9f5b38e79ea6b8464123946275bf2632825261df1e88075d1508e7e9fe3f2c0decd3dad70f53f1572b16b0be64146ceca0deb063bd0745d24dc20b158cf4070b0223f1260a2a5422a3cbe22868894a56-00763002bc2634e9776deb4f9ecb6ff6&fid=e68f4b92601ecfcddefa2571fa2d86f2'
  , id: '2'
  },
  {
    src: 'https://v3-web-prime.douyinvod.com/video/tos/cn/tos-cn-ve-15/oEE3gflqDBFNFkEB5rE8fwQeaCaI2gjAnF7GiA/?a=6383&br=1885&bt=1885&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100B_100x_100z_100o_101s&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1730553526&expire=1730564335&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4SNWjAIMppfttOLJusd.C_bAja-CInb98Ndc6Bauy1mfwGpHDDMJFktXJCiM4usZ.&is_ssr=1&l=202411022118449F8DF67628E76EBA83D4&lr=all&mime_type=video_mp4&ply_type=4&policy=4&qs=0&rc=OjU4aTs0NmkzNGczNzo2NUBpM2w8b205cmh5dDMzNGkzM0BiMmEuNTQ2XzAxLmMwMmBgYSNsMDVxMmRjZW5gLS1kLWFzcw%3D%3D&signature=757be48e01e069a84d82fa1f7318e099&tk=webid&webid=c4683e1a43ffa6bc6852097c712d14b81f04bc9b5ca6d30214b0e66b4e38528070dd6a8f7b681012cfe1119f36411ee6699a15754480952c362189d34307fcd49ae53b9ab4d383e9ea28eb92ed284aeb9f5b38e79ea6b8464123946275bf2632825261df1e88075d1508e7e9fe3f2c0decd3dad70f53f1572b16b0be64146ceca0deb063bd0745d24dc20b158cf4070b0223f1260a2a5422a3cbe22868894a56-2b85e0e484ba120cc1f90467aaa049e6&fid=e68f4b92601ecfcddefa2571fa2d86f2'
  , id: '3'
  }
]

/**
 * 我的页面 个人视频数据*/
export const personVdDta: mediaInfo[] = [
  {
    src: 'https://v2.kwaicdn.com/ksc2/UYE8lp9M5qiMcetFwxwYEQlXxc7ibc9fhDAP0lIyGZd_Jp2dPngznVCvtRPrFTd09y93SekigObCIulzn5CBblbgcEftNYWjJwxzmxLasMfmHaeKMcnSTg-iimuPKbrrZ8PU-0Huk7OLdihd2V0ru8n0eEAuz5YSAe_6ThcJR3gV2IkcPJ1x3USYYB19P71r.mp4?pkey=AAXGl64S5Vc89306BuHQdMfgc-XTIi3hEi0dTHSXxHvDoXuW9mcaZn8Ri7OuwydkDmy6jSPdEtc8yCedd7gluuSawfnQcn3N6KTWfTnAjty1E9QN4Y1QQM1k0eYIwpXuxuE&tag=1-1720429305-unknown-0-xl5txnwwhi-a950d31d2126ddc0&clientCacheKey=3xubs7zfnc6af9y_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',

  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/BEXRURDWE74GIecvh18kxwsCRbYRb8OlEgJE2gkF9hawX14sX6x6BM_q1QsshKLaJk4HyGL85-5FDon750d6-ZY38Fsu6JhQYy9p5Zl47VmiYkiNEew12n8cou3FfofeDpT1LK_aGTGsBs933k7l2xb75RXn_gBgckAvU9z_y3wdXg0HpqcrxG65ZAOT8TI8.mp4?pkey=AAVk5CvhhmzN14QViNND4-79ZAbowfLzBhYBFrGfq5iJHMxY1MnSAzLcUuSJrHHYV3a5PEjuTF8E7YKv9OzBczGwnJs9RlVSYwW8n4pW4hjyyEO3cjYkzA6SJFfhsub9NTE&tag=1-1720428955-unknown-0-40ftrr7fzf-d6ae4dfffdcdbf79&clientCacheKey=3xz8xhenhn5e6z9_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',

  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/23C6D1NHcEvoE2e9Zl4Z4_1TvvC5smE9De9eJRzGlbBe-Bd_1gRvQqGzj04QhykZ0RoxTMF6yQdR-nsGU3U7P90WbdKPMJYeNIJcvjzymO7mY3szD2Z859_V29Hclr3uqyMjmNbNy3xGXRlFLXM9Mk6cnNlIUOnGZZY6aX3cv7nc_g4KAMrHic2QRkDIfaG7.mp4?pkey=AAWdIrqDDlVZp_LDTPAAXoHRo1u0alVYS3y_clPLDsxNiw40_zufchuSQc_mg6s4ZmGg4-rBpeVH1psz_jOJpjiu9M3nS7wquR5d5qeAqy0eIhm1YbTRkFOMPqjHBhtGnrg&tag=1-1720429332-unknown-0-vf4reym5hs-877c36a6a59bf16e&clientCacheKey=3xttcvsy6ufv7d6_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',

  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/L_H9G-vH47Neo2Q6GeB1RprifNjlYQzrpk16sRMssHKs9ZhB4gIU9bhhYFJEudqqDa-Yu9DAWFLAeBx9UIawZgxDRzKkGbCp5kaT-p-NUk-TufghV-l_6NSlIcgGS7iA3gjfP4iCKxvFrnSyoiV9wzmeXtgxB2I-_eiOtwi0ReyI5yNk9PedRPuZHrZFrSVP.mp4?pkey=AAWzLRpTl4ADOcRlf9U8igX0zr4zlKt9-Es47nhLFRWOb3jo_mopq_hCst_Tt-i9g34LkbYDkKBh03funIER0i43ckmoIBJIHIJAhridpcjOnrrbXFpJq3N0t-FZEWb97aY&tag=1-1720429075-unknown-0-gqpwpe05ay-f86d53b0000111a2&clientCacheKey=3xnu7vw9pwfwy7g_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',

  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/YAquZhxFEzs8SQQxaURZtj5JUqk0RXF6OObyhvfdGzWaeR86voPYyF2BNS9bJB4IDe3Q4vy76PCgfCeY3UB-KHIllkO2LUAcEcPchxHF6IuDd2JZfieorDbE6RhYUl_QSggzqMyWYYX3jn_HmgXRfZhja6VLnzuGZfo4WIl6RWT9B-DgtcnDGBCiSIZ-eQXY.mp4?pkey=AAXPqeZzBdL_gcje9Lb80aRtpKzxRkCoX907zcSk_SHM0HrCLkjyRdLldNODeg4yqWS8FgIkT0ZYs_-K7ogZrvEeR_rfiICpqiIZNcwW9OkQ3fSasu0w5M939-68TD5I6gQ&tag=1-1720429110-unknown-0-i9ejdewncy-6bc6f7ca261c1e70&clientCacheKey=3xh7qpcc6hp4tvc_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',

  }
]
