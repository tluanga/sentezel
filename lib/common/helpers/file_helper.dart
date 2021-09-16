class FileHelper {
  static String getFileExtensionFromPath(String filePath) {
    List<String> paths = filePath.split("/");
    List<String> var1 = paths.last.split('.');
    return var1.last;
  }

  static getFileNameFromFilePathHelper(String path) {
    List<String> result = path.split("/");
    return result.last;
  }
}
