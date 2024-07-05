import { mediaInfo } from '.';
import { BasicDataSource } from '../utils/BasicDatSource';
import { mediaList } from './mediaData';

/**
 * 视频数据源类*/
export class VdDataSource extends BasicDataSource {
  /**
   * 视频数据*/
  private VdData: mediaInfo[] = mediaList;

  public totalCount(): number {
    return this.VdData.length;
  }

  public getData(index: number): mediaInfo {
    return this.VdData[index];
  }

  public addData(index: number, data: mediaInfo): void {
    this.VdData.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: mediaInfo): void {
    this.VdData.push(data);
    this.notifyDataAdd(this.VdData.length - 1);
  }
}
