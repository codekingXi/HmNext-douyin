export interface mediaInfo {
  title?: string
  src: ResourceStr
  id: number
}

export class mediaInfoModel implements mediaInfo {
  title?: string = ''
  src: ResourceStr = ''
  id: number = 0

  constructor(model: mediaInfo) {
    this.title = model.title
    this.src = model.src
    this.id = model.id
  }
}

/**
 * 主页视频数据
 * */
export const mediaList: mediaInfo[] = [
  {
    src: 'https://v26-web-prime.douyinvod.com/video/tos/cn/tos-cn-ve-15/o0AG0HtQdINFi9EPnbF8tZIilKhMBAWPWYwRu/?a=6383&br=877&bt=877&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=101s_100B_100x_100z_100o&cr=3&cs=0&cv=1&dr=0&ds=6&dy_q=1727101637&expire=1727112443&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4SNWjAIMppfttOLJusd.C_bAja-CInNPZptc6Bbw_14fwGpHDDFLZtt_TVktLusZ.&is_ssr=1&l=20240923222716393676C4948DF51CEFA5&lr=all&mime_type=video_mp4&ply_type=4&policy=4&qs=0&rc=OWQ3ZThmO2Y7PGdpZjdlaUBpajhzc3Y5cnA5dTMzNGkzM0AuYWI1M18vXzIxXl41YTViYSMvLzVyMmQ0YmBgLS1kLTBzcw%3D%3D&signature=c86f12ddec41b531cf896bcf0040ceff&tk=webid&__vid=7410787105703464218&webid=c4683e1a43ffa6bc6852097c712d14b81f04bc9b5ca6d30214b0e66b4e38528070dd6a8f7b681012cfe1119f36411ee6699a15754480952c362189d34307fcd49ae53b9ab4d383e9ea28eb92ed284aeb9f5b38e79ea6b8464123946275bf2632825261df1e88075d1508e7e9fe3f2c0decd3dad70f53f1572b16b0be64146ceca0deb063bd0745d24dc20b158cf4070b0223f1260a2a5422a3cbe22868894a56-25f9bcd324119456bca36018d8985d37&fid=e68f4b92601ecfcddefa2571fa2d86f2',
    id: 1
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/Bjd_DvmaE3PugX8nMGATNKuc6F549bGFhtvstwKhLFLT3Bqbch3cwf4sq46_ppdAfvVmOznxTRZ2YmJQ0FmUUMFbKYxP_7Mo56AU7a1YVh3iO8Z3QJm-LJKjEkc6wTg9j6QtSPx6gMjnIkYY9uP0RUPa12-GRa2835gBPgzkei8H9bpqYEYwfPJIv_9JiNih.mp4?pkey=AAXjGgaq9X17O3pls_m8wKyyQKitZf399mhalKIiar4ym9jMMUyhL85CYk2ikTIszGo-d4iZ65YxLUjWb5wKATa-XoEr7TmcfEaVVU5gRrN6jspqFjHuteMbAgsijsbZ8YI&tag=1-1727101748-unknown-0-jepgtefgfi-7897b91d4173b3be&clientCacheKey=3xnadgw6vxsqpi9_b.mp4&di=7b93f921&bp=14944&tt=b&ss=vp',
    id: 2
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/ifwHbgZhHcIZuZAAS_2FgbO8utNOIEOFwU94mku69tJ4Zlzr2p2gAtmo6tJlKGd3fIXcfKW9cVeZVbKvZ4xJX6sBXqxtpStffgw5OYAMq5VAEiVEwDdjMzenKlLmqNEZVspGyZd6x74v5UwMC9JxbzqRRYgOy1SRcY11aIqMnnOB01IVzV8fH5rMT0k3LWNz.mp4?pkey=AAWZhniECq5Tms4fVeHjpAZjTxXs-M_8FjptJe8LxxM6R8bohHrrYYrA0zQCRsaQIc11pZgCp9DfbGl2vPVwjFxGeGArvQ1ItqBqhEFLoSclI9VMd2STGHFxqRPgCV49-Dc&tag=1-1727101748-unknown-0-fualfapizz-33b9ce03fd835010&clientCacheKey=3xkvzseaaiihhzc_b.mp4&di=7b93f921&bp=14944&tt=b&ss=vp',
    id: 3
  },
]

/**
 * 我的页面 个人视频数据*/
export const personVdDta: mediaInfo[] = [
  {
    src: 'https://v2.kwaicdn.com/ksc2/UYE8lp9M5qiMcetFwxwYEQlXxc7ibc9fhDAP0lIyGZd_Jp2dPngznVCvtRPrFTd09y93SekigObCIulzn5CBblbgcEftNYWjJwxzmxLasMfmHaeKMcnSTg-iimuPKbrrZ8PU-0Huk7OLdihd2V0ru8n0eEAuz5YSAe_6ThcJR3gV2IkcPJ1x3USYYB19P71r.mp4?pkey=AAXGl64S5Vc89306BuHQdMfgc-XTIi3hEi0dTHSXxHvDoXuW9mcaZn8Ri7OuwydkDmy6jSPdEtc8yCedd7gluuSawfnQcn3N6KTWfTnAjty1E9QN4Y1QQM1k0eYIwpXuxuE&tag=1-1720429305-unknown-0-xl5txnwwhi-a950d31d2126ddc0&clientCacheKey=3xubs7zfnc6af9y_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 1
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/BEXRURDWE74GIecvh18kxwsCRbYRb8OlEgJE2gkF9hawX14sX6x6BM_q1QsshKLaJk4HyGL85-5FDon750d6-ZY38Fsu6JhQYy9p5Zl47VmiYkiNEew12n8cou3FfofeDpT1LK_aGTGsBs933k7l2xb75RXn_gBgckAvU9z_y3wdXg0HpqcrxG65ZAOT8TI8.mp4?pkey=AAVk5CvhhmzN14QViNND4-79ZAbowfLzBhYBFrGfq5iJHMxY1MnSAzLcUuSJrHHYV3a5PEjuTF8E7YKv9OzBczGwnJs9RlVSYwW8n4pW4hjyyEO3cjYkzA6SJFfhsub9NTE&tag=1-1720428955-unknown-0-40ftrr7fzf-d6ae4dfffdcdbf79&clientCacheKey=3xz8xhenhn5e6z9_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 2
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/23C6D1NHcEvoE2e9Zl4Z4_1TvvC5smE9De9eJRzGlbBe-Bd_1gRvQqGzj04QhykZ0RoxTMF6yQdR-nsGU3U7P90WbdKPMJYeNIJcvjzymO7mY3szD2Z859_V29Hclr3uqyMjmNbNy3xGXRlFLXM9Mk6cnNlIUOnGZZY6aX3cv7nc_g4KAMrHic2QRkDIfaG7.mp4?pkey=AAWdIrqDDlVZp_LDTPAAXoHRo1u0alVYS3y_clPLDsxNiw40_zufchuSQc_mg6s4ZmGg4-rBpeVH1psz_jOJpjiu9M3nS7wquR5d5qeAqy0eIhm1YbTRkFOMPqjHBhtGnrg&tag=1-1720429332-unknown-0-vf4reym5hs-877c36a6a59bf16e&clientCacheKey=3xttcvsy6ufv7d6_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 3
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/L_H9G-vH47Neo2Q6GeB1RprifNjlYQzrpk16sRMssHKs9ZhB4gIU9bhhYFJEudqqDa-Yu9DAWFLAeBx9UIawZgxDRzKkGbCp5kaT-p-NUk-TufghV-l_6NSlIcgGS7iA3gjfP4iCKxvFrnSyoiV9wzmeXtgxB2I-_eiOtwi0ReyI5yNk9PedRPuZHrZFrSVP.mp4?pkey=AAWzLRpTl4ADOcRlf9U8igX0zr4zlKt9-Es47nhLFRWOb3jo_mopq_hCst_Tt-i9g34LkbYDkKBh03funIER0i43ckmoIBJIHIJAhridpcjOnrrbXFpJq3N0t-FZEWb97aY&tag=1-1720429075-unknown-0-gqpwpe05ay-f86d53b0000111a2&clientCacheKey=3xnu7vw9pwfwy7g_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 4
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/YAquZhxFEzs8SQQxaURZtj5JUqk0RXF6OObyhvfdGzWaeR86voPYyF2BNS9bJB4IDe3Q4vy76PCgfCeY3UB-KHIllkO2LUAcEcPchxHF6IuDd2JZfieorDbE6RhYUl_QSggzqMyWYYX3jn_HmgXRfZhja6VLnzuGZfo4WIl6RWT9B-DgtcnDGBCiSIZ-eQXY.mp4?pkey=AAXPqeZzBdL_gcje9Lb80aRtpKzxRkCoX907zcSk_SHM0HrCLkjyRdLldNODeg4yqWS8FgIkT0ZYs_-K7ogZrvEeR_rfiICpqiIZNcwW9OkQ3fSasu0w5M939-68TD5I6gQ&tag=1-1720429110-unknown-0-i9ejdewncy-6bc6f7ca261c1e70&clientCacheKey=3xh7qpcc6hp4tvc_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 5
  }
]
