package com.cha.kim.wedding.core.gallery.image;

import com.cha.kim.wedding.core.gallery.category.Category;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity(name = "gallery_image")
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GalleryImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @JsonIgnore
    @ManyToOne(optional = false)
    @JoinColumn(name = "categoryId" , referencedColumnName = "id" )
    private Category category;

    @Column(length = 255)
    private String url;

}
