package kr.ac.kopo.util;

public class FileVO {
	
		private Integer fileno; // 글번호
		private String notice_id; // 부모 글번호
		private String filename; // 파일명
		private String realname; // 실제파일명
		private long filesize; // 파일 크기

		
		
		public String getNotice_id() {
			return notice_id;
		}

		public void setNotice_id(String notice_id) {
			this.notice_id = notice_id;
		}

		public String size2String() {
	        Integer unit = 1024;
	        if (filesize < unit){
	            return String.format("(%d B)", filesize);
	        }
	        int exp = (int) (Math.log(filesize) / Math.log(unit));

	        return String.format("(%.0f %s)", filesize / Math.pow(unit, exp), "KMGTPE".charAt(exp-1));
	    }

		public Integer getFileno() {
			return fileno;
		}

		public void setFileno(Integer fileno) {
			this.fileno = fileno;
		}

		public String getFilename() {
			return filename;
		}

		public void setFilename(String filename) {
			this.filename = filename;
		}

		public String getRealname() {
			return realname;
		}

		public void setRealname(String realname) {
			this.realname = realname;
		}

		public long getFilesize() {
			return filesize;
		}

		public void setFilesize(long filesize) {
			this.filesize = filesize;
		}

	
}
