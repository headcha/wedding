package com.cha.kim.wedding.admin.util;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class FileDto {
    private String uploadName;
    private String originalFilename;
    private String serverHost;
    private String downloadPath;
    private String extension;
    private String downloadUrl;
}
