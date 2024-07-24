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
    src: 'https://v2.kwaicdn.com/ksc2/QCbVGzxvQkoOYz4k9j5RNfjqk5ggXU-NHoeM3rLUDHTYQIZXUaxtpUpiHQ2LMLmxS8JJoSKtKJysVOn4l__mfk5H1AU1c0A5nf4pGnz2W7s3QOD_gIouj4OfoMVDMYl_fZjW6kIV_xemkZSDbY6WlxKF89z3ayyCvH7ikUbeATdpHV1R-ugfC4n4fKAnUr5h.mp4?pkey=AAWDAc20xMVMK4Twit9Yp4MnDMKSGigKWZSEz44AmQx6xvGZ1EM12WyFYuw46GwmzMQ40WZBa3PDGJZxbeyYNxUMEtoh0SHkUvrk8TzLUDZpYBpwagCC89SzTbFEgSVBGWo&tag=1-1721816201-unknown-0-b3totccoew-af0c28bf99131620&clientCacheKey=3xqnppgvseewvj2_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 1
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/_XFdsmyxbUa5Y81dL04jqMm16zd3JuXlX7coKSQ28EG1Muk99KvPE3LNQWw7K2GMeKWto9zrgZEHIqVbvmD3m7jNg_McWSvAnEueoY1bfmmBRugy49gyclgKXrwXclXZPpLdKlmhvDYwiGZzsKztnDQGxkqjrSxG3LrpDxUs5pvcrjx3mvtmNsKp-fkL85ev.mp4?pkey=AAU6-L2S3vRwTK4gQBt-7DHdKtYY6Gb6Mhy_SMTgRJ6HwgL5Kb86dCx10XMToMEXNEI9Opun0wbJIcBrEI3rV7e9_e2mDAWRvXzOZi5a_lClUc-mqqr4EbUaXJMVCiYnghU&tag=1-1721816227-unknown-0-0setw3ra2s-f24237a978d4d0e2&clientCacheKey=3xsmaqb6qibhq2q_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 2
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/VAoYWiL5tcALWxdx5oS1im1qx-EXQQKubzQHxpFenSxCb7rm25GQsbTbif5dwMydAVW2jRRW3Dz3uA8Vh3zH9uNRH7-BfeqyYBJmY4UbRKbGofJV6r5ZR6nxthprzHF5B_KVF9F9g4KCcDu62bUi1WByFtPpbLMmXy_kaEPD1FVrOO_uTqbjJRL3qljoI6sC.mp4?pkey=AAUZGwvx29Zpd5IpYOAm58aMW4N-CdJPG-E5N0_B8wvyBW5ydTNTxeZT-jYzRZ4rN4LJaMdV30bZ6I8JyZB5-CisucgGNXccWzR30D3cSY8z8PRA_3B35OBXOYwvgdq-pPU&tag=1-1721816227-unknown-0-uewvfkmyfu-b8d8d062569205ea&clientCacheKey=3x5wmpmzd2wwnjc_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 3
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/KNufC2M3u68Ka5EIlEJFfkbWxPlbR-2Ud1yx-KSok6qh0WqJdHoejtkN4fU1cHaGzyOilVifXNRyRonERf4NIpDlFcgD3x_HRIOTT9_Kz-R9SM2kRxIKmQGadhTSJ77CLs4d-iiIdRnFNQxhpxRn8H_N4zQLp5W4MmKFKHTfJ0xagUq3b9ddIWSemPJTclNj.mp4?pkey=AAUwG57GBdRqCbn1nta6v7sQZtuPNYmZmzYgvUTXbQR-XmrctNJWPgkk0oVUnFjfkFQMK05jgAOywGf8mxIOJ8ZJetpFvsC1-3P4mTlnzrHBVIbaTA9W7PSnYV2vOXEtrPk&tag=1-1721816227-unknown-0-w4zcx5hnvv-1f2589cfa6248c8e&clientCacheKey=3x9zyret5tn2tjm_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 4
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/-DlgdR2K-wmb0eGUDYA_5raY1Z4vgQ9urYt_6sF8GXGeWOrf-VIwzp1o__FKmol7SVcEnMD_ut_u0UI9O8i2g0s567TEp7qQGLhxEUWaUFMeuP5gZ-uvIAlo0a8dssZskwPUQ0OkL9FvyPU5x06E32Wpj_h4Um7--qFiJM933Hg.mp4?pkey=AAXXySzkE-KGeifujRHnz58yM0DnDxbFSgdYTsYv3T-fuJENKkFYkr0miPs5_x6idouA_e2FuPb94NYKTXBsx-Nf2DuwDYkRRAEq-Ex4My-QEJGPAIb6RowsOgLHj6yQSe4&tag=1-1721816227-unknown-0-k5mc1sqlod-0e7caff6aac676d8&clientCacheKey=3xhm6vcjuepy836_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 5
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/gP7OSPBCfOjMNT1jtswZfT1wP_KFUZtgfomIS-C7qGoerPiwYZkgFEJIP7vuCzBp3rBfqB1UUC9sM3RkOQ2SXpIztLawYxONH_MtRLWbC_a4D8PprJ2fLwEtFhvsZylJ1F2dzT7C1_kQUZVSlfpKmnLPCaxd3p2plkUvuxoyvQJWwMAQBx75J1RhDug_7-k_.mp4?pkey=AAVwG_Uz990MRkSVLq0B2kRgObg3f_hmRuh856MuI4bI7M4h7g5PLoX9_DUiMalZBl6BCjna1CZ7lOJ_ZdashMXDm1N9hDLi6gmSfLmgYECjXEEa0SfMWYaKWmhedqC8Tro&tag=1-1721816227-unknown-0-s1kvayrr79-bdfbd895650bb294&clientCacheKey=3xdji66qea58bcg_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 6
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/YMwL9fGIR8Ro-MD2omZzP_IXgUOg9KV8Lqr0EGc1q3gGm-ONJ-Aj_Q44-0LECjW5PpTqDrMrztjRAhzvjJLn5FN2lX4J81uRyRvTRmYH1LIhqJRTc8tNZjQnWi54XIlaocn36IFm7FanxfIi3er-37LOiQP1Ff750hqYOcbrzPZ-3eIMItfAqMTtNYQafMMg.mp4?pkey=AAVQDW1Wzn9GMMTO3fHn1AVMVPdpGhiycUuwOVvWWqoUJTuTKAHu4maOZI0d7E8QW9D_DFmFnbzi4YWgyqURL08DfdKCLA1j2E9YtJLOsat2vMd0MhwLG0PnZMMZtSM8ES4&tag=1-1721816227-unknown-0-8kgfuibx2i-bcd6ff6829ae9c21&clientCacheKey=3x4wjehi9wy5tpm_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 7
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/F335JyMrPhiKUUl0oAehgxff9BgqxIg5KPnVCtFtRh9vmIOPhxRi2sQkk0DkMi94hHDlzE0_Njt2j3Hgj0nafB3I_2pELERHtaxSIpOCRFHUW-PqXpg1eg9OFLP_FxI7pMXa02Ty5hBcGJTwQKk1JZT-LmdoHrZgyuB05mutt6hafteSKMbTYF7aIZCtnx8d.mp4?pkey=AAXlg0lJR4qwslvMX66RKXhrf2IyjcW65nQSgEEUlZMh8L6bzvGut5cDTChHZTqns92QD7cUypRu1qMyE4PTdLoE5KRanL4WgwYN4UITqlgsFAKi-vB6xYDkSP0FXTqiBLk&tag=1-1721816227-unknown-0-bkgoqgvf2c-d30aab9ddb2b3080&clientCacheKey=3xqasp6bmtdgy94_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 8
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/6X7S0DQZd9c4-AFuNM8XEgxJ9qJJkIBos8RFbaeBMer230Lw1VFR_yuDSFFDxplb0I81NA4KQo-rdwBtWF37UfXOpWDEqN0srthWOqT5s68ux22Aw2NmvRzl5LXo7q4XgLvR2ucNgFSmvAtkR1Wp0gtOGpzMoP5-rpgzT3bdBDalxjXsRWt5IBANFM8FymvK.mp4?pkey=AAVh6l4Ib1TUsqU232woXJ5da8yOFUH8T2kPNeOLIRC2Qsw9F9G_kvukiCrgs0NAnIzV0AdXQKkeVKkFbNZsIEs5RutgTTIUh6TtmyAHJrQuJnNDG4pNuIHxJtbQSzfJaXw&tag=1-1721816227-unknown-0-49gnrn8ef6-298b77268a94e88b&clientCacheKey=3xtbz9mrix7u7wc_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
    id: 9
  }, {
  src: 'https://v1.kwaicdn.com/ksc2/fWh7mS7DsqWoif4I5iYZow_dN20RMbOvji7XdRcABCxc3adbku8ULT0RtEJtyfqpho9ehTsqkQX9-lPuCtplql-dbT58bTw5iMRZRv3IsDjo-yfhYGg6O2NHfglKAxxZB3cgeU6ByJDnUZeciCRAjQt3DmcutCMCcqx8bsEzT79jEeIsGo_Y2OL1E2JLDCxb.mp4?pkey=AAVsS6-6_0uJgVOourb7vPwT1IlhADHwap6F54-53OXW4uNVlIGTagCLY_tPXsoC35-50qWGLkAzHaTBuFR787dDIsC3sh60AN9LKQslq4PauAO7WHqx6Kbh8aIFKQvc8f8&tag=1-1721816755-unknown-0-mjt9bvqpe9-e833c79191f9e70b&clientCacheKey=3xg7gaa46jst97s_b.mp4&di=75b1c47a&bp=14944&tt=b&ss=vp',
  id: 10
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
