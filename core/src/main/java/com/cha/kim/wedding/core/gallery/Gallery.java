package com.cha.kim.wedding.core.gallery;

import com.cha.kim.wedding.core.gallery.category.Category;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity(name = "gallery")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Gallery {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @OneToOne(optional = false )
    @JoinColumn(name = "weddingId" , referencedColumnName = "id")
    private Wedding wedding;

    @OneToMany(mappedBy = "gallery", cascade = CascadeType.ALL, orphanRemoval = true ,fetch = FetchType.LAZY)
    private List<Category> categories = new ArrayList<>();

    public void addCategory(Category category) {
        this.categories.add(category);
    }
}
