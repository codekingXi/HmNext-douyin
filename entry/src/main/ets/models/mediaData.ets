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
    src: 'https://v3-web.douyinvod.com/af7cd51db33912890c195525c997c49f/66756614/video/tos/cn/tos-cn-ve-15/oYAAQnl8VWmEtBRDMAzeXIngDOT9hUfgF6aAJO/?a=6383&br=3771&bt=3771&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100B_100x_100z_100o_101s&cr=3&cs=0&cv=1&dr=0&ds=6&dy_q=1718962670&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=LjhJEL998xsRu.0PO0P58lZW_3iXc8YtxVJEz7-ElbPD-Ipz&is_ssr=1&l=202406211737492D72C59666422A0CAC43&lr=all&mime_type=video_mp4&qs=0&rc=M2Q5ZTxkOGVpZGk8O2c8N0Bpajg8NmY6Zm12cjMzNGkzM0BiNGAvNjJiNV4xMF5fYTBiYSMxY2dfcjRvaHFgLS1kLTBzcw%3D%3D',
    id: 1,
  },
  {
    src: 'https://v3-web.douyinvod.com/a97c6994a1a5b9206316ad4243f20247/667566ad/video/tos/cn/tos-cn-ve-15c001-alinc2/oUb9QAr1ySZoMe7uSiBAILGKggeoAmAgLbnNkD/?a=6383&br=1574&bt=1574&btag=c0000e00028000&cd=0%7C0%7C0%7C3&ch=5&cquery=100K_100o_101s_100B_100H&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1718962670&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=LjhJEL998xsRu.0PO0P58lZW_3iXc8YtxVJEz7-ElbPD-Ipz&is_ssr=1&l=202406211737492D72C59666422A0CAC43&lr=all&mime_type=video_mp4&qs=1&rc=aTpnNTg5OjtpOmczZGc6aUBpajxmaTw6ZnAzcjMzNGkzM0AyX141XzReXi0xXmAyX14vYSNgb2BhcjRfaWtgLS1kLWFzcw%3D%3D',
    id: 2,
  },
  {
    src: 'https://v3-web.douyinvod.com/3fc34b1807ae6ee63ca8286ef2779afd/6675663a/video/tos/cn/tos-cn-ve-15/osFPp4PIQWZiBwB1ah1ZKnzFjIRAtPviQAEmG/?a=6383&br=1828&bt=1828&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100o_101s_100B_100x_100z&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1718962708&feature_id=f0150a16a324336cda5d6dd0b69ed299&ft=LjhJEL998xsRu.0PO0P58lZW_3iX5wYtxVJEz7-ElbPD-Ipz&is_ssr=1&l=202406211738278D7F4E6E79FAFE0CE605&lr=all&mime_type=video_mp4&qs=0&rc=OjVkaDM0ZmdnOWY8NzlkaUBpamluPG05cnRuczMzNGkzM0AyMGBgLl82Xy8xMzJeMF4yYSNkaGxwMmQ0YGpgLS1kLTBzcw%3D%3D',
    id: 3,
  },
  {
  src: 'https://v3-web.douyinvod.com/e3a012879b7386b97a5abf76e9f04234/6675663d/video/tos/cn/tos-cn-ve-15/oIGFQFeigqXGMLDBzn5CAtacI0IByQfA72D7e0/?a=6383&br=1617&bt=1617&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100x_100z_100o_101s_100B&cr=3&cs=0&cv=1&dr=0&ds=3&dy_q=1718962708&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=LjhJEL998xsRu.0PO0P58lZW_3iX5wYtxVJEz7-ElbPD-Ipz&is_ssr=1&l=202406211738278D7F4E6E79FAFE0CE605&lr=all&mime_type=video_mp4&qs=1&rc=ZjtnOTRpZGU6ZDNpOmU8OkBpM2VvcXg5cm82czMzNGkzM0A2YTQxXjAxXjAxNC1hLzYxYSNranI1MmRrNWhgLS1kLWFzcw%3D%3D',
  id: 4,
  },
  {
    src: 'https://v3-web.douyinvod.com/a67f8217b0af3bfc4bf6b86abff75e8d/66756666/video/tos/cn/tos-cn-ve-15/oIjIgTAQkknYAEmuf8qjANDCFnnObfAL9gBkAD/?a=6383&br=1494&bt=1494&btag=c0000e00008000&cd=0%7C0%7C0%7C3&ch=5&cquery=100z_100o_101s_100B_100x&cr=3&cs=0&cv=1&dr=0&ds=4&dy_q=1718962751&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&ft=LjhJEL998xsRu.0PO0P58lZW_3iXTwYtxVJEz7-ElbPD-Ipz&is_ssr=1&l=20240621173909414B10558114B00D673D&lr=all&mime_type=video_mp4&qs=0&rc=ZjU0N2k0NjplNjdpaDc8NkBpajg8bTw6ZjtkcjMzNGkzM0BeMl8yNTMwX14xYmA0XjEvYSNvMHJwcjRvZi5gLS1kLTBzcw%3D%3D',
    id: 5,
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
