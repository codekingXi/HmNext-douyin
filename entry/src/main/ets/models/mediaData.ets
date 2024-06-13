export interface mediaInfo {
  title?: string
  src: string | ResourceStr
  id: number
}

export class mediaInfoModel implements mediaInfo {
  title?: string = ''
  src: string | ResourceStr = ''
  id: number = 0

  constructor(model: mediaInfo) {
    this.title = model.title
    this.src = model.src
    this.id = model.id
  }
}

export const mediaList: mediaInfo[] = [
  {
    src: 'https://v3-weba.douyinvod.com/da515a53d482ab3ee14284b1f4131f01/666aa883/video/tos/cn/tos-cn-ve-15c001-alinc2/oYIAZeBz6G2KVfZoEYoz1gQANGAtAAGhpEBShx/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1688&bt=1688&cs=0&ds=3&ft=3PhjVQujppftrGLJ.CF.C_bAja-CIn6kXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=NjpoZ2doOjZpMzg8ODk0PEBpMzk4Nzc6ZjM1cjMzNGkzM0BeMjAyY140XjMxX18vLy9fYSNgZmkwcjRfaW9gLS1kLWFzcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100a&dy_q=1718258780&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=2024061314061913A608EE7C5B3D07BB26',
    id: 1,
  },
  {
    src: 'https://v3-weba.douyinvod.com/54f68f1657d233b4f629d153e9dd51d2/666aa8ec/video/tos/cn/tos-cn-ve-15c001-alinc2/oInBdCxUEBfQSIDgkb9kAhYA5qU5Wg41MkA6em/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=927&bt=927&cs=0&ds=4&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInNuXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=OzhpZTZnOjdkMzQ4aGVlNEBpanI4OWY6ZjhwczMzNGkzM0A1LmAyLWMwNi8xXmJjYzFfYSNwc2k2cjQwaS1gLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=100o_101s_100B_100x_100z&dy_q=1718258885&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&l=20240613140803E9C336886890D10765A4',
    id: 2,
  },
  {
    src: 'https://v3-weba.douyinvod.com/7e1b125e27cec59c83edd335dce82148/666aa91a/video/tos/cn/tos-cn-ve-15/oEAWiABw7FWtAFMM6XLf8SedpXZBLQXAaKXVCe/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1737&bt=1737&cs=0&ds=4&ft=3PhjVQujppftrGLJ.CF.C_bAja-CIn3uXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=NjU1ZmdpZWhoNGdmODY8OkBpamxlbnU5cnNlczMzNGkzM0AtNWNiYV9jXi4xYC1gYzIzYSNeL3E0MmRjaWFgLS1kLWFzcw%3D%3D&btag=c0000e00008000&cquery=100x_100z_100o_101s_100B&dy_q=1718258924&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&l=202406131408433EA8AB1ACB68A2074622',
    id: 3,
  }, {
  src: 'https://v3-weba.douyinvod.com/51a9a36ddc00556e7365e896d1afd961/666aa993/video/tos/cn/tos-cn-ve-15/o4f5IAC9ZAIUeYnaAFg8qFr8Qbn5m1DBJg6TtA/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=3001&bt=3001&cs=0&ds=6&ft=3PhjVQujppftrGLJ.CF.C_bAja-CIn3bXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=NmYzaDs5ZTY3PDM2PDU4ZUBpM29sazc6ZmducjMzNGkzM0A1LTNjNC0tXzMxXi0yY2NfYSMtbjRzcjRfcV5gLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=100B_100x_100z_100a_101s&dy_q=1718259052&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=20240613141050280BE1A5AC11DF054639',
  id: 4,
},
  {
    src: 'https://v3-weba.douyinvod.com/27415c6d203a2ca9b87cd82f824b1fcb/666aa9c3/video/tos/cn/tos-cn-ve-15/oc8RHGQ3IhTkCSFAjizAUziBCEcrDGCtgAYfge/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=2272&bt=2272&cs=0&ds=6&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInkLXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=NmU0ZDg1PGk2aDtlNzQ4OkBpam1qZDk6Zjs5cjMzNGkzM0A1NC40MjI0NjExXy82LV9fYSNvYHBgcjRvNF5gLS1kLTBzcw%3D%3D&btag=c0000e00010000&cquery=100B_100x_100z_100a_101s&dy_q=1718259089&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=2024061314112759CB6D5CB3F7FD08E9B8',
    id: 5,
  },
  {
    src: 'https://v3-weba.douyinvod.com/87550b54accf7333f07aeeccd137074d/666aaa20/video/tos/cn/tos-cn-ve-15c001-alinc2/ogDR9DR7EByUKIEaBf9NAj2A71YbKgfvQDAUFm/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=3404&bt=3404&cs=0&ds=6&ft=3PhjVQujppftrGLJ.CF.C_bAja-CIn7UXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=O2Y1ZGgzNGZpNGg1OGc7ZEBpanlvd3U5cnhkczMzNGkzM0BeYTBjM19hXzUxYC9hMDQtYSNhZnAtMmRzbjVgLS1kLTBzcw%3D%3D&btag=c0000e00020000&cquery=100K_100a_101s_100B_100H&dy_q=1718259150&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=20240613141229F2D20AD353F791079B19',
    id: 6,
  }, {
  src: 'https://v3-weba.douyinvod.com/24e83f56c42823c30419a672cd1a8b84/666aaa11/video/tos/cn/tos-cn-ve-15c001-alinc2/o0fMoP75BcDnDQFE9NFY9IlnBR8fEACgf1PGOA/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1119&bt=1119&cs=0&ds=4&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInYUXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=OTk0PGkzMzo6ODNnOjo8OkBpam9mcWo5cml5czMzNGkzM0AvXjMxMy0tNV4xMDZfM2BgYSM1c2wwMmRjYDRgLS1kLTBzcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100o&dy_q=1718259178&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&l=2024061314125600A2EE7312DECF07ECDE',
  id: 7,
},
  {
    src: 'https://v3-weba.douyinvod.com/a195be326d6356885f32ccdd612b1e67/666aaa60/video/tos/cn/tos-cn-ve-15/oAMKZQPBORezxXuBeGH8WlMfDcRMC7AEaMgXAB/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=2927&bt=2927&cs=0&ds=3&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInxVXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=Z2hmOmU2ODQ2OGlmNTNkaUBpajpsO3M5cnBlczMzNGkzM0BjYTZeX142X14xYTVjYzEuYSNla15wMmQ0Z2dgLS1kLTBzcw%3D%3D&btag=c0000e00020000&cquery=100B_100H_100K_100a_101s&dy_q=1718259208&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=20240613141326D4E9C2073D815B095EC9',
    id: 8,
  },
  {
    src: 'https://v3-weba.douyinvod.com/e2f6d1ee5130dc47a9e93dd094d8c7f9/666aaa49/video/tos/cn/tos-cn-ve-15/ocBkQN1VzAgzfXRAYlh1uSIREBNExopgFUeHoA/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1687&bt=1687&cs=0&ds=3&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInKVXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=ZmQ1OzdoOzdpOjk7NzpnOEBpM285bzg6ZmZ3cjMzNGkzM0A0LjNfYmE1NS8xYTU2Yy4zYSNoZ15scjQwNWZgLS1kLWFzcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100a&dy_q=1718259235&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=20240613141353D3ECB9DEA669EC07DE80',
    id: 9,
  }, {
  src: 'https://v3-weba.douyinvod.com/62aae2dc3a90011d1324c8ab6a5b8fd8/666aaa8f/video/tos/cn/tos-cn-ve-15c001-alinc2/okdEg7DIFQNCAbzkMfIkAqhEZzHpt0ABeQBUIC/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=2839&bt=2839&cs=0&ds=3&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInKhXUtc6Bo.Dbu1wGpHDDIxoo2fLK18cusZ.&mime_type=video_mp4&qs=0&rc=O2dpaWZnMzM8aTY6OjxmM0BpMzQ0bTo6ZmxqcjMzNGkzM0AxMGFjLjY1XjExYmBhYzEvYSNmbi8vcjRfaGBgLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100a&dy_q=1718259299&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=2024061314145857FB15B9E11B930924A8',
  id: 10,
},
]

export let personVdDta: mediaInfo[] = [
  {
    src: 'https://v3-weba.douyinvod.com/beafab27c13ee6c1bb8e151beac7fd92/666ad0c2/video/tos/cn/tos-cn-ve-15/o8Ym9qzBBACgQ9EIgIF4ZDCD7frleCvEAAB5nE/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1324&bt=1324&cs=0&ds=4&ft=3PhjVQujppftrGLJ.CF.C_bAja-CIn6WDUtc6BkHDnu1wGpHDDat4WmSi~ZlGusZ.&mime_type=video_mp4&qs=0&rc=O2ZnNThoZjs0ZWk3NWQ7O0BpMzg2OGo5cnhpczMzNGkzM0A1XjA0NTVjNV4xNGBhYjA1YSNwcWAzMmRzbWdgLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100o&dy_q=1718269084&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&l=20240613165802AEBD6706CA5B4308F024',
    id: 1
  },
  {
    src: 'https://v3-weba.douyinvod.com/8218a370bf84971d3e6c3a3cad50cea5/666ad0f9/video/tos/cn/tos-cn-ve-15c001-alinc2/ocLOzagJfAIY8HZwQBezSABKBiACiA0dnwBE87/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1758&bt=1758&cs=0&ds=3&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInkdDUtc6BkHDnu1wGpHDDat4WmSi~ZlGusZ.&mime_type=video_mp4&qs=0&rc=PGY5ODhnM2Y6aGY8NTMzM0BpM3RnbnU5cnMzczMzNGkzM0AyNWIxMi5gXzAxMzVjMzZfYSMybmVnMmRzNDRgLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100o&dy_q=1718269137&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=20240613165855C940356E169BA4092FCC',
    id: 2
  },
  {
    src: 'https://v3-weba.douyinvod.com/c118a348969d24880211cf570f5e955e/666ad131/video/tos/cn/tos-cn-ve-15c001-alinc2/oYvxi9NMgZyeAIxtzCEFJEijAnAhCNfvBgQSBR/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1698&bt=1698&cs=0&ds=4&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInC4DUtc6BkHDnu1wGpHDDat4WmSi~ZlGusZ.&mime_type=video_mp4&qs=0&rc=NzkzOWU0NzkzPDg4NzZoZEBpMzM5bGw5cnF0czMzNGkzM0BgX2EzYV4tX2ExMS0xYGBjYSM2Y2JyMmRzbWRgLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100a&dy_q=1718269191&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&l=202406131659506DB61B55C2CAF105DB6C',
    id: 3
  },{
    src: 'https://v3-weba.douyinvod.com/beafab27c13ee6c1bb8e151beac7fd92/666ad0c2/video/tos/cn/tos-cn-ve-15/o8Ym9qzBBACgQ9EIgIF4ZDCD7frleCvEAAB5nE/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1324&bt=1324&cs=0&ds=4&ft=3PhjVQujppftrGLJ.CF.C_bAja-CIn6WDUtc6BkHDnu1wGpHDDat4WmSi~ZlGusZ.&mime_type=video_mp4&qs=0&rc=O2ZnNThoZjs0ZWk3NWQ7O0BpMzg2OGo5cnhpczMzNGkzM0A1XjA0NTVjNV4xNGBhYjA1YSNwcWAzMmRzbWdgLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100o&dy_q=1718269084&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&l=20240613165802AEBD6706CA5B4308F024',
    id: 4
  },
  {
    src: 'https://v3-weba.douyinvod.com/8218a370bf84971d3e6c3a3cad50cea5/666ad0f9/video/tos/cn/tos-cn-ve-15c001-alinc2/ocLOzagJfAIY8HZwQBezSABKBiACiA0dnwBE87/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1758&bt=1758&cs=0&ds=3&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInkdDUtc6BkHDnu1wGpHDDat4WmSi~ZlGusZ.&mime_type=video_mp4&qs=0&rc=PGY5ODhnM2Y6aGY8NTMzM0BpM3RnbnU5cnMzczMzNGkzM0AyNWIxMi5gXzAxMzVjMzZfYSMybmVnMmRzNDRgLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100o&dy_q=1718269137&feature_id=f0150a16a324336cda5d6dd0b69ed299&l=20240613165855C940356E169BA4092FCC',
    id: 5
  },
  {
    src: 'https://v3-weba.douyinvod.com/c118a348969d24880211cf570f5e955e/666ad131/video/tos/cn/tos-cn-ve-15c001-alinc2/oYvxi9NMgZyeAIxtzCEFJEijAnAhCNfvBgQSBR/?a=6383&ch=5&cr=3&dr=0&lr=all&cd=0%7C0%7C0%7C3&cv=1&br=1698&bt=1698&cs=0&ds=4&ft=3PhjVQujppftrGLJ.CF.C_bAja-CInC4DUtc6BkHDnu1wGpHDDat4WmSi~ZlGusZ.&mime_type=video_mp4&qs=0&rc=NzkzOWU0NzkzPDg4NzZoZEBpMzM5bGw5cnF0czMzNGkzM0BgX2EzYV4tX2ExMS0xYGBjYSM2Y2JyMmRzbWRgLS1kLS9zcw%3D%3D&btag=c0000e00008000&cquery=101s_100B_100x_100z_100a&dy_q=1718269191&feature_id=46a7bb47b4fd1280f3d3825bf2b29388&l=202406131659506DB61B55C2CAF105DB6C',
    id: 6
  }
]
