package com.cha.kim.wedding.web.wedding;

import com.cha.kim.wedding.core.gallery.Gallery;
import com.cha.kim.wedding.core.gallery.category.Category;
import com.cha.kim.wedding.core.gallery.image.GalleryImage;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;

import static org.assertj.core.api.Assertions.*;


public class DisplayWeddingTest {
    @Test
    public void 이미지가_항상_4개단위_짝수여야한다() {
        Category category1 = Category.builder().galleryImages(Arrays.asList(new GalleryImage() , new GalleryImage() , new GalleryImage() , new GalleryImage() , new GalleryImage() , new GalleryImage())).build();
        Category category2 = Category.builder().galleryImages(Arrays.asList(new GalleryImage() , new GalleryImage() , new GalleryImage() , new GalleryImage() , new GalleryImage() , new GalleryImage() , new GalleryImage())).build();

        Gallery gallery = Gallery.builder().categories(Arrays.asList(category1 , category2)).build();

        Wedding wedding = Wedding.builder().gallery(gallery).families(new ArrayList<>()).build();

        DisplayWedding displayWedding = DisplayWedding.create(wedding , new ArrayList<>());

        assertThat(displayWedding.getTotalGalleryImages().size()).isEqualTo(13);
        assertThat(displayWedding.getSplitGalleryImages().size()).isEqualTo(2);
        assertThat(displayWedding.getShuffleGalleryImages().size()).isEqualTo(11);

    }
}