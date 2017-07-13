package com.cha.kim.wedding.admin.api.gallery;

import com.cha.kim.wedding.core.gallery.category.Category;
import com.cha.kim.wedding.core.gallery.image.GalleryImage;
import lombok.Getter;

@Getter
public class GalleryImageForm {
    private int id;
    private String url;

    public GalleryImage create(Category category) {
        return GalleryImage.builder().id(this.id).category(category).url(this.url).build();
    }
}
