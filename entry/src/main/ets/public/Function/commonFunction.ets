/*
 * this is a common (Functions|methods) Class library
 * 这是一个公共方法类库
 * time:2024/5/20
 * 创建时间2024/5/20
 * */
export default class commonFunction{
  /*
   * create 11 random
   * */
  public creteRandom(){
    //生成11位数的抖音号
    return Math.floor(Math.random() * (99999999999 - 10000000000 + 1)) + 10000000000
  }

}