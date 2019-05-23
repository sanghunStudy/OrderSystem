package kr.ac.kopo.util;

import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

public class UploadFileDisplay {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileDisplay.class);
    
    private static UploadFileDisplay instance;
     
    //싱글톤
    private UploadFileDisplay (){
         
    }
 
    public static UploadFileDisplay getInstance(){
        if(instance==null){
            instance=new UploadFileDisplay();
        }
        return instance;
    }
     
     
    public ResponseEntity<byte[]> disPlay(String fileName, String uploadPath) throws Exception{
        //fileName 은 /년/월/일/파일명의 형태로 입력을 받는다.
         
        InputStream in=null;
        //ResponseEntity<byte[]> 로 결과는 실제로 파일의 데이터가 된다.
        //컨트롤에서 @ResponseBody 를 이용해야 하며 
        //byte[] 데이터가 그대로 전송될 것임을 명시한다.
        ResponseEntity<byte[]> entity=null;
                 
        logger.info("File NAME : "+ fileName);
         
        try{
            String formatName =fileName.substring(fileName.lastIndexOf(".")+1);
             
            MediaType mType =MediaUtils.getMediaType(formatName);
             
            HttpHeaders headers =new HttpHeaders();
            //   경로 +/년/월/일 /파일이름
            in =new FileInputStream(uploadPath+fileName);
            if(mType!=null){
                //이미지인 경우 
                headers.setContentType(mType);
            }else{
                //이미지가 아닌 경우
                //MIME 타입을 다운로드 용으로 사용되는 'application/octet-stream 으로 지정한다.
                //브라우저는 이 MIME 타입을 보고 사용자에게 자동으로 다운로드 창을 열어 준다.
                 
                fileName=fileName.substring(fileName.indexOf("_")+1);
                //한글 깨짐 방지 설정
 
                //다운로드 할 때 사용자에게 보이는 파일의 이름이므로 한글 처리를 해서
                // 전송합니다. 한글 파일의 경우 다운로드 하면 파일의 이름이 깨져서
                // 나오기 반드시 인코딩 처리를 할 필요가 있다.
                String attach="\""+new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"";
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition", "attachment; filename="+attach);             
            }
             
            //실제로 데이터를 읽는 부분은 commons 라이브러리의 기능을 활용해서 대상
            // 파일에서 데이터를 읽어내는 IOUtils.toByteArray() 이다.
            entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
             
        }catch(Exception e){
            e.printStackTrace();
            entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        }finally{
            in.close();
        }
         
        return entity;
    }
}
