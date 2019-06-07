package kr.ac.kopo.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import net.coobird.thumbnailator.Thumbnails;
public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	static String realname;
	static String filesize;
	static String filename;
	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {

		UUID uid = UUID.randomUUID();

		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + ymdPath;

		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		String thumbFileName = "s_" + newFileName;
		File image = new File(imgPath + File.separator + newFileName);

		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		return newFileName;
	}

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		// 겹쳐지지 않는 파일명을 위한 유니크한 값 생성
		UUID uid = UUID.randomUUID();

		// 원본파일 이름과 UUID 결합
		String savedName = uid.toString() + "♧" + originalName;

		// 파일을 저장할 폴더 생성(년 월 일 기준)
		String savedPath = calcPath(uploadPath);

		// 첨부파일의 내용을 변수에 담아줌(컨트롤러에서 호출하여 db에 넣을꺼임)
		realname = originalName;
		filename = savedPath + savedName;

		filesize = Integer.toString(fileData.length);

		System.out.println(filesize + "<<<<<<<<<<<<<<<<<<<<filesize UploadFileUtils Class");
		// 저장할 파일준비
		File target = new File(uploadPath + savedPath, savedName);

		// 파일을 저장
//		FileCopyUtils.copy(fileData, target);

		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		System.out.println(formatName + "<<<<<<<<<<<<formatName");
		if (formatName.equals("jpg") || formatName.equals("png") || formatName.equals("gif")) {
			// 파일을 저장
			FileCopyUtils.copy(fileData, target);

		}
		String uploadedFileName = null;

		// 파일의 확장자에 따라 썸네일(이미지일경우) 또는 아이콘을 생성함.
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);

		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}

		// uploadedFileName는 썸네일명으로 화면에 전달된다.
		return uploadedFileName;
	}//

	// 폴더 생성 함수
	@SuppressWarnings("unused")
	public static String calcPath(String uploadPath) {

		Calendar cal = Calendar.getInstance();

		String yearPath = "/" + cal.get(Calendar.YEAR);

		String monthPath = yearPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

		String datePath = monthPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.DATE)) + "/";

		makeDir(uploadPath, yearPath, monthPath, datePath);

		logger.info(datePath);

		return datePath;
	}// calcPath

	// 폴더 생성 함수
	private static void makeDir(String uploadPath, String... paths) {

		if (new File(uploadPath + paths[paths.length - 1]).exists()) {
			return;
		} // if

		for (String path : paths) {

			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			} // if

		} // for

	}// makeDir

	// 음??? 아이콘? 이미지 파일이 아닌경우 썸네일을 대신?
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		String iconName = uploadPath + path + File.separator + fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	// 썸네일 이미지 생성
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		int dw = 100, dh = 60;

		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		int ow = sourceImg.getWidth();
		int oh = sourceImg.getHeight();
		int nw = ow;
		int nh = (ow * dh) / dw;

		if (nh > oh) {
			nw = (oh * dw) / dh;
			nh = oh;
		}

		BufferedImage cropImg = Scalr.crop(sourceImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);

		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

		String OriginPath = uploadPath + path + File.separator + fileName;

		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}