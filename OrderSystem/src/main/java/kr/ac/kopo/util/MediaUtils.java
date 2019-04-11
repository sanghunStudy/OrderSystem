package kr.ac.kopo.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream;
import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("jpg", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
