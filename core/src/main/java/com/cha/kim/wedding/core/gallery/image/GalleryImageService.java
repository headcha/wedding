package com.cha.kim.wedding.core.gallery.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class GalleryImageService {
    @Autowired
    private GalleryImageRepository galleryImageRepository;
    public void remove(int id) {
        galleryImageRepository.delete(id);
    }
}
