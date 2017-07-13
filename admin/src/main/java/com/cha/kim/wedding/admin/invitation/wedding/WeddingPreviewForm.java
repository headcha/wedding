package com.cha.kim.wedding.admin.invitation.wedding;

import com.cha.kim.wedding.admin.api.couple.CoupleForm;
import com.cha.kim.wedding.admin.api.gallery.GalleryForm;
import com.cha.kim.wedding.admin.api.gallery.GalleryImageForm;
import com.cha.kim.wedding.admin.api.schedule.ScheduleForm;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import java.util.*;


@Getter @Setter
public class WeddingPreviewForm {
    private int id;
    private String city;
    private String country;
    private String location;
    private String title;
    private Date dateTime;
    private String introduction;
    private String imageUrl;
    private GalleryForm gallery;
    private float latitude;
    private float longitude;
    private String hallImageUrl;
    private String url;
    private boolean enable;
    private List<CoupleForm> couples = new ArrayList<>();
    private List<ScheduleForm> schedules = new ArrayList<>();

    private CoupleForm female;
    private CoupleForm male;

    private List<Map<String, String>> splitGalleryImages = new ArrayList<>();
    private List<Map<String, String>> shuffleGalleryImages = new ArrayList<>();

    public String getSplitGalleryImagesCategories() {
        List<String> categoryNames = new ArrayList<>();
        gallery.getCategories().forEach(categoryForm -> {
            categoryNames.add(categoryForm.getName());
        });

        return String.join(" ", categoryNames);
    }

    public void previewGenerate() {
        couples.forEach(coupleForm -> {
            if (StringUtils.equalsIgnoreCase(coupleForm.getSexType(), "FEMALE")) {
                female = coupleForm;
            }

            if (StringUtils.equalsIgnoreCase(coupleForm.getSexType(), "MALE")) {
                male = coupleForm;
            }
        });

        List<Map<String, String>> totalGalleryImages = new ArrayList<>();
        gallery.getCategories().forEach(categoryForm -> {
            List<GalleryImageForm> galleryImages = categoryForm.getGalleryImages();
            galleryImages.forEach(galleryImageForm -> {
                Map<String, String> galleryMap = new HashMap<>();
                galleryMap.put("categoryName", categoryForm.getName());
                galleryMap.put("url", galleryImageForm.getUrl());
                totalGalleryImages.add(galleryMap);
            });
        });

        if (totalGalleryImages.isEmpty()) {
            return;
        }

        int remainder = totalGalleryImages.size() % 4;
        if (remainder > 0) {
            splitGalleryImages = totalGalleryImages.subList(0, remainder + 1);
        }

        shuffleGalleryImages = (List<Map<String, String>>) CollectionUtils.subtract(totalGalleryImages, splitGalleryImages);
    }
}
