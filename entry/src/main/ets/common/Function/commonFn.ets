/*
 * 公共方法类库*/
export default class commonFn {
  /*
   * create 11 random
   * */
  public static creteRandom() {
    //生成11位数的抖音号
    return Math.floor(Math.random() * (99999999999 - 10000000000 + 1)) + 10000000000
  }

  //生成11到200之间的随机数
  public static creteUserID() {
    return Math.floor(Math.random() * (11 + 1)) + 100
  }
}