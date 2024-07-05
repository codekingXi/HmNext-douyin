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
 * 主页视频数据*/
export const mediaList: mediaInfo[] = [
  {
    src: 'https://v3-web.douyinvod.com/69149c5a5df8bdd9966c7eec6caf7837/66865b28/video/tos/cn/tos-cn-ve-15/owMCzNG5Ah4NEFYgGQzgfB9VIheqAAprIA9Cv7/?a=6383&br=2343&bt=2343&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100B_100x_100z_100o_101s&cr=3&cs=0&cv=1&dr=0&ds=6&dy_q=1720073986&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CInncE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=20240704141944AC0794A30A215910EACB&lr=all&mime_type=video_mp4&qs=12&rc=OjszNDVoNmc4NzM6OjVnPEBpajN4aTk6ZnZucjMzNGkzM0AyY2BfYl8xX2AxLTIvXi4xYSNpZ2EwcjRnYF5gLS1kLWFzcw%3D%3D',
    id: 1,
  },
  {
    src: 'https://v3-web.douyinvod.com/d4e482c1f6611ab07d4a16b33795513c/66865b41/video/tos/cn/tos-cn-ve-15c001-alinc2/o4FEuOJPI2iDM5eEe9UDfCv2QfAFQrmABv9ZEc/?a=6383&br=1463&bt=1463&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100x_100z_100o_101s_100B&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1720074008&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CInWcE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=20240704142007D218604605249F166956&lr=all&mime_type=video_mp4&qs=1&rc=PGRkNTQ3aDo6aGg2Nzc3ZUBpanh2bWs5cjptczMzNGkzM0BiLTM1YGExNTUxNS41XzFfYSNrNmZhMmRzMXJgLS1kLTBzcw%3D%3D',
    id: 2,
  },
  {
    src: 'https://v3-web.douyinvod.com/5775418ff1873b1268edfc88b42ee001/66865b5a/video/tos/cn/tos-cn-ve-15/oMIvGIOgKEIwJQQy0OCOdAmiBotJZAT8iQRPC/?a=6383&br=2086&bt=2086&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100o_101s_100B_100x_100z&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1720074034&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CInScE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=202407041420334844EBDA63D9F716F4CE&lr=all&mime_type=video_mp4&qs=0&rc=NDw8aTw7ZTk5ZGZnPDgzZkBpampvNG45cmg3dDMzNGkzM0AvMS9iMi1gXi0xLl8yYmI2YSNiL2kyMmRrcC5gLS1kLS9zcw%3D%3D',
    id: 3,
  },
  {
    src: 'https://v3-web.douyinvod.com/14ceb87bea2731b0345c958ac3b3cfd9/66865b74/video/tos/cn/tos-cn-ve-15c001-alinc2/oACDfDK9EqmQEtFgmHiAKLifg5n9BuAgCIA44d/?a=6383&br=2193&bt=2193&btag=80000e00010000&cd=0%7C0%7C0%7C3&ch=5&cquery=100z_100o_101s_100B_100x&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1720074054&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CInZFE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=20240704142053D218604605249F16874B&lr=all&mime_type=video_mp4&qs=0&rc=aTs5ZTtkZWVlPDg2OWYzOEBpamtuOm05cnU1dDMzNGkzM0AtMGAvYDZeXy0xYzNeYTM2YSNjcS1sMmRrcC5gLS1kLS9zcw%3D%3D',
    id: 4,
  },
  {
    src: 'https://v3-web.douyinvod.com/c15301c230f71e649efa8814a5a9b224/66865b6a/video/tos/cn/tos-cn-ve-15/o0bue9fEaMCyuiKHEeWQAeMxDDA2l5UQgC85I2/?a=6383&br=1816&bt=1816&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100z_100o_101s_100B_100x&cr=3&cs=0&cv=1&dr=0&ds=6&dy_q=1720074054&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CInZFE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=20240704142053D218604605249F16874B&lr=all&mime_type=video_mp4&qs=1&rc=NWk6aGVoNTM6ZTU1N2Q4ZEBpanJkPHE5cnB3dDMzNGkzM0AuYGNgYGFjNWMxNjFjYTYxYSNkcGpkMmQ0ay5gLS1kLS9zcw%3D%3D',
    id: 5,
  },
  {
    src: 'https://v3-web.douyinvod.com/946d685e393c693bc32af4c722a51304/66865b96/video/tos/cn/tos-cn-ve-15/oEvA3IAuP0QCB44BVIgEFiQQ9KOTjZwPNTkAi/?a=6383&br=2044&bt=2044&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=101s_100B_100x_100z_100o&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1720074094&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CIngFE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=202407041421323561787D9F78DE1B257A&lr=all&mime_type=video_mp4&qs=0&rc=Ozg3NjU6O2hkPGg1ZDY4ZUBpam1wZm45cmk0czMzNGkzM0BeXy80LzA0XzYxMzZgNTJgYSMzMzQ1MmRrMzRgLS1kLS9zcw%3D%3D',
    id: 6,
  },
  {
    src: 'https://v3-web.douyinvod.com/83a560e9a8e5f031c665cd8d660d70a5/66865bc0/video/tos/cn/tos-cn-ve-15c001-alinc2/okCNZCM9uILMA6pAimtgreB9ibfQABjItEJmtD/?a=6383&br=1421&bt=1421&btag=80000e00020000&cd=0%7C0%7C0%7C3&ch=5&cquery=100H_100K_100o_101s_100B&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1720074094&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CIngFE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=202407041421323561787D9F78DE1B257A&lr=all&mime_type=video_mp4&qs=1&rc=ODw7OjkzaGVkZGRkOmU8O0BpM2hqdHc5cmdnczMzNGkzM0BiNjYwMV80Xi8xNjI0MDRhYSMubzYyMmRzcmdgLS1kLS9zcw%3D%3D',
    id: 7,
  },
  {
    src: 'https://v3-web.douyinvod.com/14b7d61c52ff3971ad2f420b59c6a57e/6686587f/video/tos/cn/tos-cn-ve-15/oMyBYeFCoAF7GTCIgFfIAvCGrBBLQ1ZsN8Oyoe/?a=6383&br=1442&bt=1442&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100o_101s_100B_100x_100z&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1720073304&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=AJkeU_TERR0s~dC52Nl2Nc0iPMgzbLepSvsU_42.88iJNv7TGW&is_ssr=1&l=2024070414082306CB95F782A62F153E03&lr=all&mime_type=video_mp4&qs=1&rc=Z2U5ZDo7ZDQ6N2hkNzRpaEBpM3hlb3k5cm81dDMzNGkzM0BjNDFgYGBeXzAxLzIwL2M0YSMzNWRwMmRzZy5gLS1kLTBzcw%3D%3D',
    id: 8,
  },
  {
    src: 'https://v3-web.douyinvod.com/b30cf8d641a26bcfb098c715005459b6/66865bbe/video/tos/cn/tos-cn-ve-15/oUlCFeleeBQNLBAdQMc07KDGAIPBaqg2xCA0IM/?a=6383&br=2149&bt=2149&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=101s_100B_100x_100z_100o&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1720074133&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CInJxE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=20240704142212C1FBEA187BB4441AD7DF&lr=all&mime_type=video_mp4&qs=0&rc=OTZpODczZ2c5OTVoMzw4ZkBpMzQ1OnE5cjdsdDMzNGkzM0AxYTJgL182XjYxNC0yYi9hYSNxcmBiMmRrZy1gLS1kLWFzcw%3D%3D',
    id: 9,
  },
  {
    src: 'https://v3-web.douyinvod.com/23c38f87ecc28b8ee18e9291a97cbe31/66865bbb/video/tos/cn/tos-cn-ve-15/o0aICER6gAAkAmwreifBUzBB3BQTmiAroVlEQD/?a=6383&br=1782&bt=1782&btag=80000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100z_100o_101s_100B_100x&cr=3&cs=0&cv=1&dr=0&ds=6&dy_q=1720074133&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=4TMWc6DnppftrGLJ.CF.C_bAja-CInJxE~tc6BLVt.u1wGpHDDs4LSdXyCs58usZ.&is_ssr=1&l=20240704142212C1FBEA187BB4441AD7DF&lr=all&mime_type=video_mp4&qs=12&rc=OzhoO2Y3OmhpZDRnOTg1aEBpM2VwM2o5cjU7dDMzNGkzM0A1My9jNDAxX18xYzBiMjBiYSNna2BnMmRjLS5gLS1kLS9zcw%3D%3D',
    id: 10,
  }
]

/**
 * 我的页面 个人视频数据*/
export const personVdDta: mediaInfo[] = [
  {
    src: 'https://v3-web.douyinvod.com/375c38a828a1ebb29ba2f43351a35d73/66756367/video/tos/cn/tos-cn-ve-15/osmIDKca6BBIJAe9EA9EmTWQDHAegCb4yznnD3/?a=6383&br=2388&bt=2388&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100B_100x_100z_100o_101s&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1718961981&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=LjhJEL998xsRu.0PO0P58lZW_3iX~EYtxVJEz7-ElbPD-Ipz&is_ssr=1&l=20240621172620010D8E0D2CBDE60E29AC&lr=all&mime_type=video_mp4&qs=0&rc=NWRpOWU4PDw5MztnNjUzN0BpajR1bjU6Zng8cjMzNGkzM0BfLjJgYjUtXzQxXjZeY2I2YSNvbm8zcjRnbWJgLS1kLTBzcw%3D%3D',
    id: 1
  },
  {
    src: 'https://v3-web.douyinvod.com/0a33cd5a508339230058dbc4d02f3ba7/66756363/video/tos/cn/tos-cn-ve-15c001-alinc2/oME9LNmAf9jZUpicBAIcNWilQBQBagf9iAAX3a/?a=6383&br=1688&bt=1688&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100z_100o_101s_100B_100x&cr=3&cs=0&cv=1&dr=0&ds=4&dy_q=1718961981&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=LjhJEL998xsRu.0PO0P58lZW_3iX~EYtxVJEz7-ElbPD-Ipz&is_ssr=1&l=20240621172620010D8E0D2CBDE60E29AC&lr=all&mime_type=video_mp4&qs=0&rc=PGk4ZDNlOjRnM2doOTw6OEBpM2c8d3c5cm54czMzNGkzM0AxMGBhX2NfNTYxLjQ0YV9jYSNlbG9gMmRzX2FgLS1kLWFzcw%3D%3D',
    id: 2
  },
  {
    src: 'https://v26-web.douyinvod.com/b507fc50b28d722060617ee554682e2e/6675639b/video/tos/cn/tos-cn-ve-15/ochALgfFmIzQZMQAAdNgtuhWzvEWeBrANBG7YB/?a=6383&br=1449&bt=1449&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=101s_100B_100x_100z_100o&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1718962037&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=LjhJEL998xsRu.0PO0P58lZW_3iXRiYtxVJEz7-ElbPD-Ipz&is_ssr=1&l=20240621172715A06FD62B8A744C08423D&lr=all&mime_type=video_mp4&qs=0&rc=NGRnNjo0PDhpaWU0OWY6ZUBpajlmZWY6ZmZwcjMzNGkzM0AxNmE2NS5eNS4xYi8yYDBhYSNia2lfcjRvLWtgLS1kLWFzcw%3D%3D',
    id: 3
  },
  {
    src: 'https://v26-web.douyinvod.com/4489e590f913a7960cc9cb848c2e429c/6675639b/video/tos/cn/tos-cn-ve-15c001-alinc2/oAiSXHdjGId8y0TMANLdEY7NeCewMeBQIhAPB6/?a=6383&br=1260&bt=1260&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100B_100x_100z_100o_101s&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1718962037&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=LjhJEL998xsRu.0PO0P58lZW_3iXRiYtxVJEz7-ElbPD-Ipz&is_ssr=1&l=20240621172715A06FD62B8A744C08423D&lr=all&mime_type=video_mp4&qs=1&rc=ZDM7NjxlOmhkO2Y3NWY6N0BpanlsZm45cjQ2czMzNGkzM0AwMzExX2IuXmAxYGMxXy4tYSNgM3JwMmRrZ25gLS1kLS9zcw%3D%3D',
    id: 4
  },
  {
    src: 'https://v3-web.douyinvod.com/028ef106f78a0960a7a889c903a5d853/667563dd/video/tos/cn/tos-cn-ve-15/okLA4BicbHBMeLgqEOShi7bAfzNP5zEA9xIZ96/?a=6383&br=1263&bt=1263&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100B_100H_100K_100o_101s&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1718962103&feature_id=59cb2766d89ae6284516c6a254e9fb61&ft=LjhJEL998xsRu.0PO0P58lZW_3iXB7YtxVJEz7-ElbPD-Ipz&is_ssr=1&l=202406211728220FDA6C9848FBF20DEB9D&lr=all&mime_type=video_mp4&qs=0&rc=ZTs5PGkzZTplaGc0PDs7OUBpM2Q5aW05cmZyczMzNGkzM0BgMzAyYjNgNjExYjQtMjI2YSNwMGI0MmRzMWFgLS1kLWFzcw%3D%3D',
    id: 5
  }
]
