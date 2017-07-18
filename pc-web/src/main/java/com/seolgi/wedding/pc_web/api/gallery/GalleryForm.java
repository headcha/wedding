package com.seolgi.wedding.pc_web.api.gallery;

import com.seolgi.wedding.core.gallery.Gallery;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

@Getter
public class GalleryForm {
    private int id;
    private List<CategoryForm> categories = new ArrayList<>();

    public Gallery create(Wedding wedding) {
        Gallery gallery = Gallery.builder().id(this.id).wedding(wedding).categories(new ArrayList<>()).build();
        categories.forEach(categoryForm -> gallery.addCategory(categoryForm.create(gallery)));
        return gallery;
    }
}
