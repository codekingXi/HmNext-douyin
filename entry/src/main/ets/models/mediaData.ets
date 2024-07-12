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
    src: 'https://v1.kwaicdn.com/ksc2/p8TIEMaNGxzLKyKSF4fm9T3t7IxxY6vaKYYuU9L7cIRMtQ4rU8WmxEPGbO4K8suvwlQ9m0d9n1hyTgAh9Xgk7MtcC6N6D5fMIXg2CDRaVdtqd4KDMJOFSwmtUZm7t1f7-nthX5Q523WNXSbsbdRDj9xX5UNRUMaMmgyYKecXBANyAL0aKPtdbN3jzTcqA1sN.mp4?pkey=AAXEhp3qi5Gik3dPnQTfk8GQgW2UUBqIPtYha-bOohMZC27DzC5U9At9oSZ2VHL8siVoAhPTOXFF7uXbsDODP_-rYXoj3xxiLkSmUNP5KIeMWh55vF4zx3_keIj1EITzKck&tag=1-1720775717-unknown-0-nhfdifh3ye-cab2207bb9688c78&clientCacheKey=3xycpnzfkd62bm9_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 1
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/NBw9CsuJieQF7XYDNY6wqe6S8r414oJMNIU5ZfzyLwe9Q7PHoS30dGRvj15orD5jQK5YoblNr0a2Jx3vDRUl3kNT1oNK7llrJFP3YA10bVCYJ463NpugASQS3y4QpZH0ITkPYk_z0ZOD7YZTp9tOzZs4UA78JguWQrDCK1a77mgIV4x6ruZkWoOHM-BAitKG.mp4?pkey=AAWmdRJsj8Knz5B_qKpmnzVJh7TXt2dyrqficjncCh-5tR3uGOdyBNXX2HsjKDb9a3ytXYsZTGVizEtVEywpiky3Z3H42tZq_tvRL6VNpIE3BUyKeJHAiuTzdBN8OZ2390c&tag=1-1720775717-unknown-0-hrwh33ip7r-8044fc4a24fcee0c&clientCacheKey=3x6w7fcw3usvtpa_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 2
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/LzH4xDSkcYols_BHaYbWNAOPr_2xJpQjAOJagk-NXAKlNU6nc5QA6m3nE2rCqFrzP_60uOu33FjJFJahKiXjyATU1LBSxTDr9ZR1WdOneQ6LgtWfk3rHRgaqc06XVG4jKzhxw8vxAG6GhCFIxorV5H4NPoedMnDism2l2BaT-yRuW_cmqI6JYqszRgqCniho.mp4?pkey=AAV8twY5IJrtq_ewBC7T5gYle4ZDyksEP0GQIz5fzIdrCZQVoflyYzBuVzONAwmsJTwcdSowbQ-kXkgbIb6dcsKwTbkQy9FaZfJIuzeMHuNWpJ4zQUJ6DDMIWcppBSJNdrs&tag=1-1720775717-unknown-0-o2nk8wml9a-a7df7da861e973d1&clientCacheKey=3xbh2jnnf2jpvay_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 3
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/9qPd5lKVRRjcOCMErS_jpnaKRYhTIklq87BabihxB8BoObCqNJYK__abZRl2HCzfRszsUBtCoCPQwAD3fbeYYzDE1BYQGgnL7zvH3PVWMWBGh5IdPTKeHBVMt-yPCgkrltmDkuRSMeX4Vi5gstw0e0c7VHka2MmEv2Ji-MWeY4nmDiwTCZUnNRzFkCHCNW2l.mp4?pkey=AAVl-vBQe1RTzaOXTAcQkNJWSsFz9EnAs0g8iZnMp-5Fm3UFa54z3AnYSnpBrhQDOIU5ExLSLlVeZLswPIgVqqt7i76HszDVJ7SUrqreQvg4N_H5ykea4Cwboiug2JwUyIU&tag=1-1720775717-unknown-0-hzmgrkpu2s-ab5a60efb3bc32ac&clientCacheKey=3xt883d54qq4etq_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 4
  },
  {
    src: 'https://v1.kwaicdn.com/ksc2/etnX1aS0IBCH6ruOPHDPkbf_zGf51pH1zFhwnJ0AiJ6Uik4848D8FQPPz-2v4lkR32YQrESsJ1rZAIRuV0sF7iEdUxCQ-UPmlEmQyQ4Q6LerzfGhJFyO_xhCTr29WjLnv5XMck_w6zuQywdT77h0bXNpF2zKKHhFAQ9P-ynRQ9v7ob7pk-8S4uGe3LtcrItA.mp4?pkey=AAWC8GIMGOZnuGRG-ixMwZltCJeSqTmO6of0b9iSLO3Zpnk1OLcy2j3m1XONuCQdmmPLZqULK-JY5VVCp5tF0voWhHTmfJRhd_TXiRM94CNKp5HS0zm6FzbqS34NJMfGbPo&tag=1-1720775717-unknown-0-zpz3azrsnl-e11b50de646a9e5c&clientCacheKey=3xrfez7u97u84yk_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 5
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/vX7GLVQ4FCTGuACDEKM9N_UAqrZ8XDgXZviQ6NAkODl6axnUTJ416aXW5q_KDPd4vNV4w3ywIlzXJ-kur1diz4Mz5wxKqHtkBCXp7P5erKeFfqiA100B75Rn5jlmLQI-X3V-CXxi_ghPDLCyvgm_0O726ySNMJHbIc8KUDYp4HIMU5bBoza3NOtWnTg46pcW.mp4?pkey=AAXN8POtVlWbDZVcR-LNfDVE2yOAaYjskIpExfMVoihUDONXfecTw-XvXDG4eG2-rDThwUY1cmEOZSzNH22hWsYHBoMg5ygJUhWB0aZd-5fV_dEXv4nckVsr9GlSEwW-IQ0&tag=1-1720775717-unknown-0-d2zrzhz7p6-1d62d3d9f6ea71ed&clientCacheKey=3xkpsqwa72rk83q_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 6
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/3RYHW4lhCtHxE0aG0iFxiQLhyJM5fItsLQRVR3C0DlQW26R76_wNnqwyypYhxAISJoLOEgVZ30a1WUshpshf6UXG0p8tOSCgykfzE2AgHYMwkKHBSXOTUopDwGA-mzbRBo8bf0eWD8F351nWnt0TwAHBJjEK1qx0yP0cYp0CE3Y__B3rkN00jGzMR-Y4NFyE.mp4?pkey=AAXIHp_H-IE763G7vJ1cn5vOA0SJps8Kb5pRjH6EUHtOnvn6CR8Z0OCWekgRHQAOICMszJnowvxnwp-gq_tVGnEK3SOBxgmrcB2NkrQ-Rr92YklQcxLPBhIUUbM6l0xtYEU&tag=1-1720775717-unknown-0-nfem6nkbma-280ad40ea9d29440&clientCacheKey=3xpui2cdq4syjfq_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 7
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/9C8coMrANL161FbCJmg2OJsVUikm7KUshf9R7bp1H3eyMjt1s59jBMPMRgBQFkgg4gMOXwO-YUkX1EpvX_5_WS5NWpku6s8z4X5jI-BF0TUzgSOiZlE1QDzYw2-G4pwkDOWLE5GsfMFx9bCtM5vMC5KiBPZqkF15XKGC5ZJW0oFZEKz4wl6jyxq-QwkZOLcz.mp4?pkey=AAWeLJ0eX8SuCbcCDOKLn24Rnpte1TRZkrghgN5fUaXV2Q7iu92A0RYwafimDKVh6-demqXvwWyLZvHceLCKe8Bk2DYTQ8FyTvlQj39FetEY8w688Zle7yU4n7K8Ubg59UI&tag=1-1720775717-unknown-0-xtheddvair-a7c1acbcc13d14c0&clientCacheKey=3xkf5fhb8ja2tdm_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 8
  },
  {
    src: 'https://v2.kwaicdn.com/ksc2/IXuXwBFrHfSUemwwii9CJpUgtfpoFMnpO0YE7W7xtfiGC5BSn6xdXH7ayX8LwfI2-nCbLXzT1_z2Ns6tILm9dM6nS8HxjlfvcNsR9EvrnNBAVJg4pVmJyZNLncBg3xt6IeVpPIifqII23FuZYCDNCbTNBebOcfDQ3cQO4k5LeFb80PAD6rrv-Wo7MZSWiLmU.mp4?pkey=AAX8H8vD1A-BzDlEutRJNs4YOuBafbrPsbj4N1WeJkicn2uoq3lhcL7occj9wS_se7ptNsdu8ouI2UXqDIXdgJ1HQ80RXWR-MqCKVIe5z8AoAzdZGp9_dT7GPGaP-vWhV-M&tag=1-1720775717-unknown-0-zatvakuovp-1117dd9337a8bcd3&clientCacheKey=3xbm742hyckqen6_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
    id: 9
  }, {
  src: 'https://v2.kwaicdn.com/ksc2/JhdZF8m6u7Z8SdCaC2vxJxN4tLDdL-4O1nmd-j1MHKNf3DggaoDPbZjL9t72DC4AkttO0-t9xaPZKQODTpHQx3Zp0ergeIjM_yGk179P8lvR5FyuwrBPF6rvE9IYQCNsHRf6azeJpTpMut6UZt90KE6VE44fJZdATObZ-1PwC8ZiuXJGSerSP9GsQUQtiLsj.mp4?pkey=AAWG1xSSuecWAcXXCUqtwm914w0GC-uFwAvYGqHmG-YBIkM79rkfQTFDy-NAoixHAsILjEECQG_2i0rhoVZHZmm5u9u9cZXs2c7iYVHgrv6CAfzd-UqCRutIJGrrezEOvDo&tag=1-1720775717-unknown-0-5jqhwphyvz-1d175b977ada3322&clientCacheKey=3x96pkiv7hvjsnq_b.mp4&di=JAiEaV4wCa-FJTssL4SX-Q==&bp=14944&tt=b&ss=vp',
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
