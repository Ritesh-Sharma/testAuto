package com.avekshaa.ImageOptimization;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.Properties;

import javax.imageio.IIOImage;
import javax.imageio.ImageReader;
import javax.imageio.ImageTypeSpecifier;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.metadata.IIOInvalidTreeException;
import javax.imageio.metadata.IIOMetadata;
import javax.imageio.metadata.IIOMetadataNode;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.ImageOutputStream;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.avekshaa.common.FolderZiper;

public class ImageCompression {
	public static void main(String[] args) throws IOException {

		/*
		 * ImageCompression imageCompression = new ImageCompression();
		 * imageCompression.compressImages();
		 */
	}

	public String compressImages(String upload_directory,
			String imageSourcePath, String imageDestinationPath,
			String zipFilePath, String ZipfileName, int dpi, float imageQuality) {
		/*
		 * String imageSourcePath = ""; String imageDestinationPath = ""; int
		 * dpi = 96; float imageQuality = 0.6f;
		 */
		int i = 0;
		String files = null;
		InputStream is = null;
		OutputStream os = null;
		BufferedImage image = null;
		ImageInputStream iis = null;
		ImageOutputStream ios = null;
		ImageWriter writer = null;
		ImageReader reader = null;
		try {
			/*
			 * Properties configProperties = new Properties();
			 * 
			 * try { configProperties.load(new FileInputStream(
			 * "./Configuration/Configuration.properties")); imageSourcePath =
			 * configProperties.getProperty("ImageSourcePath");
			 * imageDestinationPath = configProperties
			 * .getProperty("ImageDestinationPath"); dpi =
			 * Integer.parseInt(configProperties.getProperty("DPI"));
			 * imageQuality = Float.parseFloat(configProperties
			 * .getProperty("ImageQuality"));
			 * 
			 * } catch (FileNotFoundException e) { e.printStackTrace(); } catch
			 * (IOException ex) { ex.printStackTrace(); }
			 */
			File folder = new File(imageSourcePath);
			File[] listOfFiles = folder.listFiles();
			int counter = listOfFiles.length;
			System.out.println("Batch Size: " + counter);
			System.out.println("Compression Process Start.......");
			for (i = 0; i < listOfFiles.length; i++) {

				if (listOfFiles[i].isFile()) {
					files = listOfFiles[i].getName();
					System.out.println("File Name is: " + files);

					File sourceImageFile = new File(imageSourcePath + files);

					File compressedImageFile = new File(imageDestinationPath
							+ files.substring(0, files.length() - 4)
							+ "_Compressed.jpg");

					try {
						is = new FileInputStream(sourceImageFile);
					} catch (FileNotFoundException e) {

						e.printStackTrace();
					}

					try {
						os = new FileOutputStream(compressedImageFile);
					} catch (FileNotFoundException e) {

						e.printStackTrace();
					}

					// create a BufferedImage as the result of decoding the
					// supplied
					// InputStream

					try {
						image = ImageIO.read(is);
					} catch (IOException e) {

						e.printStackTrace();
					}

					// get all image writers for JPG format

					Iterator<ImageWriter> writers = ImageIO
							.getImageWritersByFormatName("jpg");

					if (!writers.hasNext())

						throw new IllegalStateException("No writers found");

					writer = (ImageWriter) writers.next();

					try {
						ios = ImageIO.createImageOutputStream(os);
					} catch (IOException e1) {

						e1.printStackTrace();
					}

					writer.setOutput(ios);

					ImageWriteParam param = writer.getDefaultWriteParam();

					// compress to a given imageQuality
					param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
					param.setCompressionQuality(imageQuality);

					if (dpi == 0) {
						int xDPI = 0;
						int yDPI = 0;
						try {

							iis = ImageIO
									.createImageInputStream(sourceImageFile);
							Iterator it = ImageIO.getImageReaders(iis);
							if (!it.hasNext()) {
								System.err.println("No reader for this format");
							}
							reader = (ImageReader) it.next();
							reader.setInput(iis);

							IIOMetadata meta = reader.getImageMetadata(0);
							IIOMetadataNode root = (IIOMetadataNode) meta
									.getAsTree("javax_imageio_1.0");
							NodeList nodes = root
									.getElementsByTagName("HorizontalPixelSize");
							if (nodes.getLength() > 0) {
								IIOMetadataNode dpcWidth = (IIOMetadataNode) nodes
										.item(0);
								NamedNodeMap nnm = dpcWidth.getAttributes();
								Node item = nnm.item(0);
								xDPI = Math.round(25.4f / Float.parseFloat(item
										.getNodeValue()));
								System.out.println("xDPI: " + xDPI);
							} else
								System.out.println("xDPI: -");
							if (nodes.getLength() > 0) {
								nodes = root
										.getElementsByTagName("VerticalPixelSize");
								IIOMetadataNode dpcHeight = (IIOMetadataNode) nodes
										.item(0);
								NamedNodeMap nnm = dpcHeight.getAttributes();
								Node item = nnm.item(0);
								yDPI = Math.round(25.4f / Float.parseFloat(item
										.getNodeValue()));
								System.out.println("yDPI: " + yDPI);
							} else
								System.out.println("yDPI: -");

							IIOMetadata data = writer.getDefaultImageMetadata(
									new ImageTypeSpecifier(image), param);
							Element tree = (Element) data
									.getAsTree("javax_imageio_jpeg_image_1.0");
							Element jfif = (Element) tree.getElementsByTagName(
									"app0JFIF").item(0);
							jfif.setAttribute("Xdensity",
									Integer.toString(xDPI));
							jfif.setAttribute("Ydensity",
									Integer.toString(yDPI));
							jfif.setAttribute("resUnits", "1"); // density is
																// dots per inch
							try {
								data.mergeTree("javax_imageio_jpeg_image_1.0",
										tree);
							} catch (IIOInvalidTreeException e) {
								e.printStackTrace();
							}

							// appends a complete image stream containing a
							// single image and
							// associated stream and image metadata and
							// thumbnails to the
							// output

							try {
								writer.write(data, new IIOImage(image, null,
										data), param);
							} catch (IOException e) {

								e.printStackTrace();
							}

						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						IIOMetadata data = writer.getDefaultImageMetadata(
								new ImageTypeSpecifier(image), param);
						Element tree = (Element) data
								.getAsTree("javax_imageio_jpeg_image_1.0");
						Element jfif = (Element) tree.getElementsByTagName(
								"app0JFIF").item(0);
						jfif.setAttribute("Xdensity", Integer.toString(dpi));
						jfif.setAttribute("Ydensity", Integer.toString(dpi));
						jfif.setAttribute("resUnits", "1"); // density is dots
															// per inch
						try {
							data.mergeTree("javax_imageio_jpeg_image_1.0", tree);
						} catch (IIOInvalidTreeException e) {
							e.printStackTrace();
						}

						// appends a complete image stream containing a single
						// image and
						// associated stream and image metadata and thumbnails
						// to the
						// output

						try {
							writer.write(data, new IIOImage(image, null, data),
									param);
						} catch (IOException e) {

							e.printStackTrace();
						}
					}

					// close all streams

					try {
						is.close();
						iis.close();
						os.close();
						ios.close();
						reader.dispose();
						writer.dispose();
					} catch (IOException e) {
						e.printStackTrace();
					}

				}
				System.out.println("Image processing left: " + counter--);
			}
			System.out.println("Compression Process Finished.......");
			System.out.println("Batch Process Finished.......");

			FolderZiper folderZiper = new FolderZiper();
			// String zipFileLocation = zipFilePath+ZipfileName+".zip";
			folderZiper.zipFolder(upload_directory, zipFilePath,
					imageDestinationPath, ZipfileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

}
