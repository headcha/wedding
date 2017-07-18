package com.seolgi.wedding.pc_web.api.gallery;

import com.seolgi.wedding.core.gallery.Gallery;
import com.seolgi.wedding.core.gallery.category.Category;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;


@Getter
public class CategoryForm {
    private int id;
    private String name;
    private List<GalleryImageForm> galleryImages = new ArrayList<>();

    public Category create(Gallery gallery) {
        Category category = Category.builder().id(this.id).gallery(gallery).name(this.name).galleryImages(new ArrayList<>()).build();
        galleryImages.forEach(galleryImageForm -> category.addGalleryImage(galleryImageForm.create(category)));

        return category;
    }
}
