package com.cha.kim.wedding.admin.api.gallery;

import com.cha.kim.wedding.core.gallery.Gallery;
import com.cha.kim.wedding.core.gallery.category.Category;
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
