package com.avekshaa.common;
 
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FolderZiper {
  public static void main(String[] a) throws Exception {
    //zipFolder("C:\\uploads\\CompressImages\\11-6-2014[1405058415356]", "C:\\uploads\\CompressImages\\MyFile.zip");
  }

  static public void zipFolder(String srcFilesPath, String compressedImagesPath, String srcFolder, String destZipFile) throws Exception {
	System.out.println("Zip Process Start...");
    ZipOutputStream zip = null;
    FileOutputStream fileWriter = null;

    fileWriter = new FileOutputStream(destZipFile);
    zip = new ZipOutputStream(fileWriter);

    addFolderToZip("", srcFolder, zip);
    zip.flush();
    zip.close();
    System.out.println("Zip Process Finished...");
    System.out.println("Delete Original Files Process Start...");
    System.out.println("Original Images File Path: "+srcFilesPath);
    System.out.println("Compressed Images File Path: "+srcFolder);
    DeleteFiles deleteFiles = new DeleteFiles();
    deleteFiles.deleteOriginalFiles(srcFilesPath);
    deleteFiles.deleteOriginalFiles(compressedImagesPath);
  }

  static private void addFileToZip(String path, String srcFile, ZipOutputStream zip)
      throws Exception {

    File folder = new File(srcFile);
    if (folder.isDirectory()) {
      addFolderToZip(path, srcFile, zip);
    } else {
      byte[] buf = new byte[1024];
      int len;
      FileInputStream in = new FileInputStream(srcFile);
      zip.putNextEntry(new ZipEntry(path + "/" + folder.getName()));
      while ((len = in.read(buf)) > 0) {
        zip.write(buf, 0, len);
      }
    }
  }

  static private void addFolderToZip(String path, String srcFolder, ZipOutputStream zip)
      throws Exception {
    File folder = new File(srcFolder);

    for (String fileName : folder.list()) {
      if (path.equals("")) {
        addFileToZip(folder.getName(), srcFolder + "/" + fileName, zip);
      } else {
        addFileToZip(path + "/" + folder.getName(), srcFolder + "/" + fileName, zip);
      }
    }
  }
}
