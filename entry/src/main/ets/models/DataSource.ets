import { BasicDataSource } from '../utils/BasicDatSource';

/**
 * 数据源类*/
export class DataSource<T> extends BasicDataSource {
  /**
   * 数据源*/
  private DataArray: T[] = [];

  constructor(el: T[]) {
    super();
    this.DataArray = el;
  }

  public totalCount(): number {
    return this.DataArray.length;
  }

  public getData(index: number): T {
    return this.DataArray[index];
  }

  public addData(index: number, data: T): void {
    this.DataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: T): void {
    this.DataArray.push(data);
    this.notifyDataAdd(this.DataArray.length - 1);
  }

  /**
   * 尾部添加一组数据
   * start 和 end === slice方法
   * @param data 原始数据
   * @param start 索引开始
   * @param end 索引结束 */
  public pushArrayData(data: T[], start: number, end: number) {
    this.DataArray.push(...data.slice(start, end));
    this.notifyDataAdd(this.DataArray.length - 1);
  }
}
