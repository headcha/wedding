package com.cha.kim.wedding.web.wedding;

import com.cha.kim.wedding.core.couple.Couple;
import com.cha.kim.wedding.core.couple.SexType;
import com.cha.kim.wedding.core.family.Family;
import com.cha.kim.wedding.core.gallery.image.GalleryImage;
import com.cha.kim.wedding.core.gift.Gift;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.cha.kim.wedding.core.story.Story;
import com.cha.kim.wedding.web.couple.DisplayCouple;
import com.cha.kim.wedding.web.famliy.DisplayFamily;
import com.cha.kim.wedding.web.gift.DisplayGift;
import com.cha.kim.wedding.web.story.DisplayStory;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.Delegate;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Getter
public class DisplayWedding {
    @Delegate(excludes = Exclude.class)
    @Getter(AccessLevel.NONE)
    private Wedding wedding;
    private List<DisplayGift> gifts;
    private List<DisplayFamily> familyList = new ArrayList<>();
    private List<GalleryImage> totalGalleryImages = new ArrayList<>();
    private List<GalleryImage> splitGalleryImages = new ArrayList<>();
    private List<GalleryImage> shuffleGalleryImages = new ArrayList<>();

    private interface Exclude {
        String getIntroduction();
        String getGreetings();
        List<Gift> getGifts();
        List<Story> getStories();
    }


    private DisplayWedding(Wedding wedding , List<Gift> gifts) {
        this.gifts = gifts.stream().map(gift -> DisplayGift.create(gift)).sorted((o1, o2) -> Boolean.compare(o1.isComplete() , o2.isComplete())).collect(Collectors.toList());
        this.familyList = wedding.getFamilies().stream().map(family -> DisplayFamily.create(family)).collect(Collectors.toList());
        this.wedding = wedding;
        copyGalleryImageList();
        splitGalleryImage(4);
    }


    private void splitGalleryImage(int splitNumber) {
        if (totalGalleryImages.isEmpty())
            return;

        int remainder = totalGalleryImages.size() % splitNumber;

        if (remainder > 0)
            splitGalleryImages = totalGalleryImages.subList(0, remainder + 1);

        shuffleGalleryImages = (List<GalleryImage>) CollectionUtils.subtract(totalGalleryImages, splitGalleryImages);
        Collections.shuffle(shuffleGalleryImages);
    }

    public static DisplayWedding create(Wedding wedding , List<Gift> gifts) {
        if (wedding == null)
            wedding =  new Wedding();

        return new DisplayWedding(wedding , gifts);
    }

    private void copyGalleryImageList() {
        List<GalleryImage> galleryImages = new ArrayList<>();
        this.wedding.getGallery().getCategories().forEach(category -> galleryImages.addAll(category.getGalleryImages()));
        totalGalleryImages.addAll(galleryImages);
    }


    public DisplayCouple getMale() {
        List<Couple> couples = this.wedding.getCouples();

        if (couples.isEmpty())
            return new DisplayCouple();

        List<Couple> maleFilter = couples.stream().filter(couple -> couple.isEqualsTo(SexType.MALE)).collect(Collectors.toList());

        if (maleFilter.isEmpty())
            return new DisplayCouple();

        return DisplayCouple.create(maleFilter.get(0));
    }

    public DisplayCouple getFemale() {
        List<Couple> couples = this.wedding.getCouples();

        if (couples.isEmpty())
            return new DisplayCouple();

        List<Couple> femaleFilter = couples.stream().filter(couple -> couple.isEqualsTo(SexType.FEMALE)).collect(Collectors.toList());

        if (femaleFilter.isEmpty())
            return new DisplayCouple();

        return DisplayCouple.create(femaleFilter.get(0));
    }

    public String getSplitGalleryImagesCategories() {
        List<String> categoryNames = this.splitGalleryImages.stream()
                .map(galleryImage -> galleryImage.getCategory().getName())
                .collect(Collectors.toList());

        return String.join(" ", categoryNames);
    }

    public String getIntroduction() {
        if (StringUtils.isEmpty(wedding.getIntroduction()))
            return StringUtils.EMPTY;
        return this.wedding.getIntroduction().replace("\n", "<br>");
    }

    public String getGreetings() {
        if (StringUtils.isEmpty(wedding.getGreetings()))
            return StringUtils.EMPTY;
        return this.wedding.getGreetings().replace("\n", "<br>");
    }

    public List<DisplayStory> getStories() {
        return this.wedding.getStories().stream().map(story -> DisplayStory.create(story)).collect(Collectors.toList());
    }
}
