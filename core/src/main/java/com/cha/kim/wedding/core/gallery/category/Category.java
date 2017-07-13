package com.cha.kim.wedding.core.gallery.category;

import com.cha.kim.wedding.core.gallery.Gallery;
import com.cha.kim.wedding.core.gallery.image.GalleryImage;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
@Entity (name = "category")
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(length = 11 , nullable = false)
    private String name;

    @OneToMany (mappedBy = "category" , cascade = CascadeType.ALL , orphanRemoval = true)
    private List<GalleryImage> galleryImages = new ArrayList<>();

    @JsonIgnore
    @ManyToOne(optional = false , fetch = FetchType.LAZY)
    @JoinColumn(name = "galleryId" , referencedColumnName = "id")
    private Gallery gallery;

    public void addGalleryImage(GalleryImage galleryImage) {
        this.galleryImages.add(galleryImage);
    }
}
