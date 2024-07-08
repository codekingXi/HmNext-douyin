import { BasicDataSource } from '../utils/BasicDatSource';

/**
 * 数据源类*/
export class DataSource<T> extends BasicDataSource {
  /**
   * 视频数据*/
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
}
