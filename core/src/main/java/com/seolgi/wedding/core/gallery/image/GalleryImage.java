package com.seolgi.wedding.core.gallery.image;

import com.seolgi.wedding.core.gallery.category.Category;
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

    @ManyToOne(optional = false)
    @JoinColumn(name = "categoryId" , referencedColumnName = "id" )
    private Category category;

    @Column(length = 255)
    private String url;

}
