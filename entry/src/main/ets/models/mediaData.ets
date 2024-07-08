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
 * 快手的数据 抖音未知原因无法播放*/
export const mediaList: mediaInfo[] = [
  {
    src: 'https://v2.kwaicdn.com/ksc2/xL756J4udxHGxNv3NdY3AbKa-ukuhz8L0XJ72KkdMQhgGDHcZwBCofk_f5OW4jhZYLWdoy5dJ_MO-1MVgKHQB6FP-TuflicuQGnsJK4aX3_c8C2rojkTSKNja63-1SSDGCFG4ra-2xJBTXCP3MFNKKsZGTTucQJigj-WgfChs2tyeJXZ7D5sI9a7jkmlqVKW.mp4?pkey=AAXR1qtjYTb2fhIA52w_Azmb65p6A-VSAcBDWORc0VjZFgihEm3EF6CO1VzL3azrIabpDiCY2D660siOI4WGsFcmlnQ9tI_QySeDv5JmddaBR9YlG-BgVa6VNiI81SlINQo&tag=1-1720425172-unknown-0-wk7mv1gzdo-44428d5300a58603&clientCacheKey=3xseuirqva6gpai_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 1
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/mBb9ijEd8Jk1LIQRiob7NCL4RK4mQCoqJ5TVELXo5n3ER4Z__TXEkdhnciySn9fqNqt9TcaGLTx-ZOaIUa7f4RPEx9IZYOiyY793ZXa2OUSwe3uipEg-qnuSXZ0Gc-HwHCdAgVPuFs3xkrUXYtOaCEYZnmXQB7AQILSfbdkYzI30IqZGexVd9StlkOBOciM5.mp4?pkey=AAWItbPetyLagIHDZ3kMmhHC0thDOsWagdS4YOHBbVybUtY6E8DVbnr-p-ZFFV4r1rUlQ5mZwP4IjxECFylpfQVqYh2XSNLqqxHnM5QjffPitVsmTlRDYQgJFFH9b7zurl4&tag=1-1720425306-unknown-0-tyzz9fkhj0-821da287d0f39f79&clientCacheKey=3xufufhfnphvtey_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 2
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/U1grWQE5b2r5MApQYTJKrFApBqnWRjL8ZlCy-KSLmjMZvwAvgYuhaHbtQ2UTL3hZv-Nks9jzh-lXA3perTHyPnN_Os6e6sVDITTXvQrqB4r1XrQnXrutYlm2i2s1BLF54PnubWAHr_I4y23XL8L-tiYBGs9vp6dPqMdBLP7lDSS1dux_SUFXhY1MZL5mqY-S.mp4?pkey=AAXLvihwLLcw87po88cK3N_msnNUeBLv0q6j8qVlFCdlnhAlYcxBX8iEftU79fgqLkgsYS3FmNoYR6KtEIFJwAwD8XVnlVTBMLaEL5-8a-zM9B8zohjl8PtHtv7dnkD7sAk&tag=1-1720425371-unknown-0-8idyhjqcdm-3b6171ad03dbc1ec&clientCacheKey=3xfbnfmp8xqgxxk_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=10004&tt=b&ss=vp',
    id: 3
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/yWFsQbGRkbrHCHDiu6Br-GynOtiST9UaBRRXeuk3KpfcWcmhFdIB-y1RBDCr1HwESfHFQu6-KviP_dr2ntR2aadYFT3NPQ_0oWEtv7PnQ9tEaoRHo97HP8KMuSqgFuWbE-pXYBXFU3fHcsT1L774c4MQaIp_apEGIoBmcKRaYeQEiDCJLUfzHbKSwOPzqQuD.mp4?pkey=AAW1PJjPqL0EhV_8eaYOt256ObfVPh3YsKSWDww9mf10ZpKxIvXmFynd-uc_vTuoH2FSL3wBVBGQcIJToTlN2IVSOfgRtAb2ks4pTT2M6kP_8jq6cmwPJF3bt2_ddaEqvb8&tag=1-1720425435-unknown-0-9lqyr01jzn-4cd2af7e2891b332&clientCacheKey=3xs7bxd77cbvyzs_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=10004&tt=b&ss=vp',
    id: 4
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/2oXfAcyS8JEeopcSROmPV7x_NACb-QGYJiaBG8FL3tmPNPe-VmGxO-SiJgDw4YF3udqhFIc5ZVYONDUBQmgw159fgIhRfR8UiR2enJCRjKjlFGIuifum1uM55uQUMSOSoQlPTmFqCOtom8ZpNlkD1p219EkiZZ-q9MoWF-D18GZ98379cGbBassLd3EEekGG.mp4?pkey=AAX3KlhytfwpykX3_8MgYJWN8m81r9K0S42jD_5ypuoUHYD9L3EgjX_uVlpKdjaGJyTvNgX6tHzmxIzwdQtZpvl0aonmQllaZ_ExwImxDSXqKiV2gu_MLaLGwFmx0WurCxQ&tag=1-1720425435-unknown-0-kmzvzslhdo-08f9f9b963a14080&clientCacheKey=3xfv9svq525najk_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=10004&tt=b&ss=vp',
    id: 5
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/bjEgzGfREOCznSM5uIKmvfqJaS2GXQ2514irDY5WaSDHomuxCKEPxXMarzbckXSvnkC2SnGA1kgK8_rCrPw9CCvKnAIQ4-jri5fuHljPcb0YuvjYR7dB2F4cH4V0f_AXSXw_A4-utsXP5SIfD3vTQUmu6ozJSfiqwm4gkj1NNd3QQRSRakSftXJJtS_WMvV0.mp4?pkey=AAXSgUNSkZgI4Bvda7QG_ixaYqKXNr-8KXjdGc3GPwrwCiUAuqO6oxGjglITpOzuwt3dSyYZ2MMuULC4DpE8B7h9y58wgeNXobUSqbrMlITdVYHk9sYNKYfHhGd8O__QNo4&tag=1-1720425493-unknown-0-rokpxi4vny-5bbaa1827a742f08&clientCacheKey=3xszgmdqqsjcs2q_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=10004&tt=b&ss=vp',
    id: 6
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/w4eAKd5QHvu39XnJ_IeQUXwbiucDWbLl2q-RwwACPDQyb3r2ck-xaJt2yfNtE1rzIj-Evg0QAiQj0TqATPvl84KBtbmCAS_3Yt0uoLo4ZWsYjLqQw5cdgSuA_8C5rwSLDcD-V9Vo-TUvuIIf2lhdIfM23_CRiFaSVoGqa_ZZFbYPc8vRqURYNvB5rlMQmCTn.mp4?pkey=AAUzhswW54wxCd54QzTKFydGL74dWyjlDIsBIZPOUZ5yUdOsme6SYAdWMcLlvIwg8VxDigTGm0xn-MDde3VPwsEucXqRP9xXabmO6ZQI-3T86J2WNChX1eUfbb6vDmCKJ9c&tag=1-1720425952-unknown-0-d9ncdepi9f-9f37fa7d42515aa1&clientCacheKey=3xazxy8ms4fe45u_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
    id: 7
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/8sV2e1yvt-XEVixU2S0a1_8YItw0kYBqrvE9xyMuuPmTSucu94tJOCMzDwKQP2dgS2mSukTsDfbYMsFRh1cHZ4QYcJn_--LDZFjztNHcTBxd6BWdUq9wKcrF4J1vx1nirwRmFp9BI4bYVb_g5j5HWvdBthOokcA_q5w6gNsm-JmdOWpx3FET9_9AeOD6lAzc.mp4?pkey=AAWu_TPd4JAO0Dw0YmJ_mAb_ESrunm_3AC2B3DwTxsqAVlSFiGBnCG_vSo3nmDykGRebsEEsKyCy5yur22w3C4fWmh-3tbf5g4Mbt7OLXFL7qeCfOrLIW9LwLoVlbYFGIiY&tag=1-1720425493-unknown-0-irdpvplkjh-fadd8b518c7a4f01&clientCacheKey=3xss95q4augu8fy_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=10004&tt=b&ss=vp',
    id: 8
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/xin-SessTDvLi8LRaj2tYG4zNd17IRVaxHzexu_L5m4-Jj8LkoE5f5IWJsTdNjVz139oBwUzkDSq9Mfes4AhvZwvLbICmDxfTYIX_TKq2gl1EIFRpJvM3dXiKbSEmiI1nhsbw9XMlpBx4feOe1S_rEIXoNHc_4uhJNHQiTjYfnQ8ncuF8b1XMdLRnEcOaVCi.mp4?pkey=AAURRocLiyW6jFS5VF967GSGll2bEuNtpzTpAVMq7bNnO0a_pw5rRP_cgsvXQBvyEJKho8gI1kI-rcWWMujPc4csN61v1c54LFeSr1lx28oTWRnwUIvjs28umd2ewZFuKvI&tag=1-1720425547-unknown-0-jb491kt3ye-69a681b4e52a1f40&clientCacheKey=3xhcj94u66bauqk_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=10004&tt=b&ss=vp',
    id: 9
  }, {
  src: 'https://v2.kwaicdn.com/ksc2/xNpIqsMYpOztotgfriGVBo71pQnvKplJG_35TuB8L9qpaQSIK3sftqgSirNm6Qu6YaICG6OMXoGdWlHMxlKTl3qeipKa6acA-_JZbe8WX10w1bbB0TJFH5peftWb7iljPjofBM-tnxYiEU-rXy63a7XbX1jSOAapxH6zwdTzvsuo9nFLrF4P0pgRjkO_gBqy.mp4?pkey=AAWUPB9eK8C7dZnyFsABk_JIAO9NssEbCm0cfFkqpVZXg1tBKPwOX6-1toTNLQRWIaN0JmRd4d3_t_qZF4yVOHrUJEJsYPgKeoRI8Z1L4HQS0KMxrkOjDc6fRs2upPHGZV4&tag=1-1720425676-unknown-0-ybaywqsktg-b71c8b8ee239017d&clientCacheKey=3x9adb4wscgwqr6_b.mp4&di=JAiEaV6QAS9IaFXypFEO_Q==&bp=14944&tt=b&ss=vp',
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
