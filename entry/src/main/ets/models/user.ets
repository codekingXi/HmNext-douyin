import { CURRENT_USER } from '../constants'
import commonFunction from '../public/Function/commonFunction'

export interface UserInfo {
  username: string //用户名
  password: string //用户密码
  tiktokNub: number //抖音号
  avatar: string //头像
  user_id: string //用户id
  content: string //聊天内容
}

//@Observed
export class UserInfoModel implements UserInfo {
  username: string = ''
  password: string = ''
  tiktokNub: number = 0
  avatar: string = ''
  user_id: string = ''
  content: string = ''

  constructor(model: UserInfo) {
    this.username = model.username
    this.password = model.password
    this.tiktokNub = model.tiktokNub
    this.avatar = model.avatar
    this.user_id = model.user_id
    this.content = model.content
  }
}

export const defaultUserInfo: UserInfo[] = [
  {
    username: "小趴菜",
    password: '',
    tiktokNub: new commonFunction().creteRandom(),
    avatar: 'https://img2.baidu.com/it/u=2778471297,524433918&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
    user_id: '1',
    content: '你真可爱'
  },
  {
    username: 'boss',
    password: '',
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fd064be90-6b8c-4a6d-9721-837206fbb4a7%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069489&t=c810057a56c27b5747e1e92bfde37799',
    tiktokNub: new commonFunction().creteRandom(),
    user_id: '2',
    content: '你真可爱'
  },
  {
    username: '天使',
    password: '',
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fabf9e746-a09c-4b08-bcba-1e347a370226%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069489&t=b47c00cad15f8dbdc390e82b95348ed2',
    tiktokNub: new commonFunction().creteRandom(),
    content: '恶魔和你在一起吗',
    user_id: '3',
  },
  {
    username: '老婆',
    password: '',
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Ff1d11ab1-35ff-4f2c-b9e9-3e0c996d34a2%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069489&t=e3234db982e8a36639d170fc5cec7848',
    tiktokNub: new commonFunction().creteRandom(),
    content: '我最爱的就是宝贝了',
    user_id: '4'
  },
  {
    username: '妈妈',
    password: '',
    tiktokNub: new commonFunction().creteRandom(),
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F9853de1a-3985-42e6-be59-849853318793%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069489&t=f960a72e50a399ddec92b18b3c7fc2d9',
    content: '哈哈哈,吃饭没有',
    user_id: '5'
  },
  {
    username: '兄弟',
    password: '',
    tiktokNub: new commonFunction().creteRandom(),
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fe9543d7c-02f3-484f-a3f0-5bfa8b2e6ef9%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069502&t=118303a29ce4a8ef2c1a496ae880b76b',
    content: '今天心情如何',
    user_id: '6'
  },
  {
    username: '杰克',
    password: '',
    tiktokNub: new commonFunction().creteRandom(),
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F8d90d041-784a-407f-a82e-b851fafdf746%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069547&t=d374ebb6973f68b95ba345827a304455',
    content: '上号打游戏？',
    user_id: '7'
  },
  {
    username: '欧威',
    password: '',
    tiktokNub: new commonFunction().creteRandom(),
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F373c6d24-1f8b-4000-8dd9-8d8410c35e71%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069618&t=51805a82420593c2a3cda47b9f65a80e',
    content: '你什么时候出门',
    user_id: '8'
  },
  {
    username: '宝石',
    password: '',
    tiktokNub: new commonFunction().creteRandom(),
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fbb560b27-a0b7-4062-ae40-efe4e5a8a748%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069619&t=8605f8477712cf9c5a1159db0cd7dab4',
    content: '这颗钻石真美',
    user_id: '9'
  },
  {
    username: '服饰A',
    password: '',
    tiktokNub: new commonFunction().creteRandom(),
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fdc2617f6-4a68-4d4a-8c54-8cbc84e3446a%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1708069619&t=a8b7b4f1e600d53e5547479d947b1809',
    content: '这件衣服很合身',
    user_id: '10'
  }
]


export const CurrentUser: UserInfo = AppStorage.get(CURRENT_USER) as UserInfoModel