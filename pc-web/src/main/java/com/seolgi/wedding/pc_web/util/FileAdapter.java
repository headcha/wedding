package com.seolgi.wedding.pc_web.util;

import com.seolgi.wedding.core.util.MimeTypeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;

@Slf4j
@Component
public class FileAdapter {

    @Value("${admin.image.api.server.host}")
    private String serverHost;

    private ByteArrayResource getByteArrayResource(final MultipartFile image) throws IOException {
        return new ByteArrayResource(image.getBytes()) {
            @Override
            public String getFilename() throws IllegalStateException {
                try {
                	String fileName =  URLEncoder.encode(image.getOriginalFilename(), "utf-8");
                    return fileName;
                }catch(Exception e){
                    log.error("파일 업로드 파일 이름 인코딩 중 에러 발생");
                    throw new RuntimeException(e);
                }
            }
        };
    }

    public FileDto uploadFile(MultipartFile file) throws  IOException {
        MultiValueMap<String, Object> multiValueMap = new LinkedMultiValueMap<>();

        if (MimeTypeUtil.isNotAllowFile(file.getInputStream()))
            throw new RuntimeException("files is Not Allow");

        multiValueMap.add("file", getByteArrayResource(file));

        URI uri = URI.create(serverHost + "/api/file/temp");
        return RestTemplateFactory.getInstance().postForObject(uri, multiValueMap, FileDto.class);
    }
    
    public File convert(MultipartFile file) throws IOException{    
        File convFile = new File(file.getOriginalFilename());
        file.transferTo(convFile); 
        return convFile;
    }

}
