package com.cha.kim.wedding.admin.api.gallery;

import com.cha.kim.wedding.core.gallery.image.GalleryImageService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * Created by 1002610 on 2016. 6. 7..
 */
@RestController
@RequestMapping("/api/gallery/image")
public class GalleryImageApiController {

    private GalleryImageService galleryImageService;

    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public void deleteImage(int id) throws  IOException {
        galleryImageService.remove(id);
    }

}
