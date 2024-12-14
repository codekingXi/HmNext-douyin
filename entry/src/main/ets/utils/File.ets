import { fileIo } from '@kit.CoreFileKit'

/**
 * 文件操作*/
class File {
  /**
   * 创建文件*/
  static crateAudioFile(userId: string) {
    const dir = getContext().filesDir + '/' + userId
    const flag = fileIo.accessSync(dir)
    if (!flag) {
      fileIo.mkdirSync(dir)
    }
    let filePath = dir + '/' + Date.now() + 'wav'
    const file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE)
    fileIo.closeSync(file)
    return filePath
  }

  /**
   * 删除一个文件*/
  static delFile(filePath: string) {
    if (filePath) {
      fileIo.unlinkSync(filePath)
    }
  }

  /**
   * 删除用户目录*/
  static delUserPath(userId: string) {
    if (userId) {
      const dir = getContext().filesDir + '/' + userId
      const flag = fileIo.accessSync(dir)
      if (flag) {
        fileIo.rmdirSync(dir)
      }
    }
  }
}