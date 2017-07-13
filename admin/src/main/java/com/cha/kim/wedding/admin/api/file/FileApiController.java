package com.cha.kim.wedding.admin.api.file;

import com.cha.kim.wedding.admin.auth.Authority;
import com.cha.kim.wedding.core.util.MimeTypeUtil;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/api/file/")
@Secured({Authority.USER})
public class FileApiController {
    @Value("${admin.file.temp.uploadPath}")
    private String tempFileUploadPath;
    @Value("${admin.image.server.host}")
    private String imageServerHost;
    @Value("${admin.image.save.path}")
    private String imageSavePath;



    @RequestMapping(value = "image" , method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<UploadFile> uploadImage(MultipartFile image) throws FileUploadException, IOException {
        if(MimeTypeUtil.isNotImage(image.getInputStream()))
            throw new FileUploadException("file is Not image");

        UploadFile uploadFile = UploadFile.builder()
                .status("success")
                .originalFilename(image.getOriginalFilename())
                .imageServerHost(imageServerHost)
                .uploadPath(tempFileUploadPath + imageSavePath)
                .path(imageSavePath)
                .build();

        FileUtils.copyInputStreamToFile(image.getInputStream(), uploadFile.createUploadFile());
        return ResponseEntity.ok(uploadFile);
    }
}
