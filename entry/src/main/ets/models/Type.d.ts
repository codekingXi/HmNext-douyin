/**
 * 商品数据类型模型*/
export declare interface shopTypeModel {
  "name": string
  "cover": string
  "imgs": string[]
  "price": number
  "real_price": number
  "isLowPrice": boolean
  "discount": string
  "sold": number
}
/**
 * 一级列表可视区域的起始索引和终点索引。
 *
 * @interface
 * @property {number} start - 可视区域起点索引。
 * @property {number} end - 可视区域终点索引。
 */
export declare interface ListIndexPosition {
  start: number,
  end: number,
}