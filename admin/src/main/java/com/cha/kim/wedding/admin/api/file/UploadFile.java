package com.cha.kim.wedding.admin.api.file;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.util.UUID;

/**
 * Created by headcha on 2015-09-15.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
public class UploadFile {
    private String status = "success";
    private String name;
    private String path;
    @JsonIgnore
    private String originalFilename;
    @JsonIgnore
    private String imageServerHost;
    @JsonIgnore
    private String uploadPath;

    public File createUploadFile() {
        this.name = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(this.originalFilename).toLowerCase() ;
        return new File(uploadPath + name);
    }

    public String getPath() {
        return this.imageServerHost + this.path + this.name;
    }

}
