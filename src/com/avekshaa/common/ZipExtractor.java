package com.avekshaa.common;

/**
 *
 * @author Rahul Biyani
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class ZipExtractor {

    // Expands the zip file passed as argument 1, into the
    // directory provided in argument 2
    public static void main(String[] args) {
        try {
            ZipExtractor p = new ZipExtractor();
            String filename = "D:/main/Upload/25-3-2014[1398408742979]/ha.zip";
            String path = "D:/main/Upload/25-3-2014[1398408742979]/";
            p.zipReader(filename, path);
        } catch (Exception ex) {
            Logger.getLogger(ZipExtractor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void zipReader(String zipFileNamePath, String outdir) throws Exception {

        // create a buffer to improve copy performance later.
        byte[] buffer = new byte[2048];

        // open the zip file stream
        InputStream theFile;
        theFile = new FileInputStream(zipFileNamePath);
        ZipInputStream stream = new ZipInputStream(theFile);

        try {

            // now iterate through each item in the stream. The get next
            // entry call will return a ZipEntry for each file in the
            // stream
            ZipEntry entry;
            while ((entry = stream.getNextEntry()) != null) {
                String s = String.format("Entry: %s len %d added %TD",
                        entry.getName(), entry.getSize(),
                        new Date(entry.getTime()));
                System.out.println(s);
                String fileWithPath = entry.getName();
                String fileName = fileWithPath.substring(fileWithPath.lastIndexOf("/") + 1);
                // Once we get the entry from the stream, the stream is
                // positioned read to read the raw data, and we keep
                // reading until read returns 0 or less.
                String outpath = outdir + "/" + fileName;
                FileOutputStream output = null;
                try {
                    output = new FileOutputStream(outpath);
                    int len = 0;
                    while ((len = stream.read(buffer)) > 0) {
                        output.write(buffer, 0, len);
                    }
                } finally {
                    // we must always close the output file
                    if (output != null) {
                        output.close();
                    }
                }
            }
        } finally {
            // we must always close the zip file.
            stream.close();
            File file = new File(zipFileNamePath);
            boolean deleted = file.delete();
            System.out.println(deleted);
        }
    }
}
