package com.cha.kim.wedding.core.util;


import org.apache.commons.collections.map.HashedMap;
import org.apache.tika.Tika;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

public class MimeTypeUtil {
    private MimeTypeUtil(){}

    private static final Map<String , String> IMAGE_MIME_TYPE = new HashedMap();

    static {
        IMAGE_MIME_TYPE.put("image/bmp" , "image/bmp");
        IMAGE_MIME_TYPE.put("image/x-png" , "image/x-png");
        IMAGE_MIME_TYPE.put("image/png" , "image/png");
        IMAGE_MIME_TYPE.put("image/gif" , "image/gif");
        IMAGE_MIME_TYPE.put("image/ief" , "image/ief");
        IMAGE_MIME_TYPE.put("image/jpeg" , "image/jpeg");
        IMAGE_MIME_TYPE.put("image/tiff" , "image/tiff");
        IMAGE_MIME_TYPE.put("image/x-cmu-raster" , "image/x-cmu-raster");
        IMAGE_MIME_TYPE.put("image/x-portable-anymap" , "image/x-portable-anymap");
        IMAGE_MIME_TYPE.put("image/x-portable-bitmap" , "image/x-portable-bitmap");
        IMAGE_MIME_TYPE.put("image/x-portable-graymap" , "image/x-portable-graymap");
        IMAGE_MIME_TYPE.put("image/x-portable-pixmap" , "image/x-portable-pixmap");
    }

    public static boolean isImage(InputStream inputStream) throws IOException {
        Tika tika = new Tika();
        String mimeType = tika.detect(inputStream);
        return IMAGE_MIME_TYPE.containsKey(mimeType);
    }

    public static boolean isNotImage(InputStream inputStream) throws IOException {
        return isImage(inputStream) == false;
    }
}
