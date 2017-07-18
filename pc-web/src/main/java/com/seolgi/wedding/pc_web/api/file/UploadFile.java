package com.seolgi.wedding.pc_web.api.file;

import com.seolgi.wedding.pc_web.util.FileDto;
import lombok.Getter;

/**
 * Created by headcha on 2015-09-15.
 */

@Getter
public class UploadFile {
    private String status = "success";
    private String name;
    private String path;
    private String originalFilename;
    private String imageServerHost;
    private String uploadPath;


    public String getPath() {
        return this.imageServerHost + this.path + this.name;
    }

    public static UploadFile create(FileDto fileDto) {
        UploadFile uploadFile = new UploadFile();
        uploadFile.name = fileDto.getUploadName();
        uploadFile.path = fileDto.getDownloadPath();
        uploadFile.originalFilename = fileDto.getOriginalFilename();
        uploadFile.imageServerHost = fileDto.getServerHost();
        uploadFile.uploadPath = fileDto.getDownloadPath();

        return uploadFile;
    }
}
