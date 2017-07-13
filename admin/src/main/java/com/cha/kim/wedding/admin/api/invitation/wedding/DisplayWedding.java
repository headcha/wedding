package com.cha.kim.wedding.admin.api.invitation.wedding;

import com.cha.kim.wedding.core.couple.Couple;
import com.cha.kim.wedding.core.couple.SexType;
import com.cha.kim.wedding.core.family.Family;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Delegate;
import org.apache.poi.ss.usermodel.DateUtil;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@ToString
public class DisplayWedding {
    @Delegate
    @Getter(AccessLevel.NONE)
    private Wedding wedding;

    @Setter
    private long allVisitorCount;
    @Setter
    private long allShareCount;
    @Setter
    private long sumAllFundingAmount;
    @Setter
    private long allGuestCount;

    public List<Family> getFamilyList() {
        return getFamilies();
    }

    public static DisplayWedding create(Wedding wedding) {
        DisplayWedding displayWedding = new DisplayWedding();
        if (wedding == null)
            displayWedding.wedding = new Wedding();
        else
            displayWedding.wedding = wedding;
        return displayWedding;
    }

    public double getDDayRate() {
        if (getWeddingDate() == null)
            return 0;

        // 생성일로 부터  day 까지 총 일수
        long totalDate = (getWeddingDate().getTime() - getCreateDate().getTime()) / (24 * 60 * 60 * 1000);
        // 생성일로 부터 현재 날짜 까지  총 일수
        long dDate = (new Date().getTime() - getCreateDate().getTime()) / (24 * 60 * 60 * 1000);
        return ((double) dDate / (double) totalDate) * 100;
    }

    public long getDDate() {
        if (getWeddingDate() == null)
            return 0;

        return (getWeddingDate().getTime() - new Date().getTime())/ (24 * 60 * 60 * 1000);
    }

    public Date getDateTime() {
        return wedding.getWeddingDate();
    }

    public Couple getMale() {
        List<Couple> couples = this.wedding.getCouples();

        if (couples.isEmpty())
            return new Couple();

        List<Couple> maleFilter = couples.stream().filter(couple -> couple.isEqualsTo(SexType.MALE)).collect(Collectors.toList());

        if (maleFilter.isEmpty())
            return new Couple();

        return maleFilter.get(0);
    }

    public Couple getFemale() {

        List<Couple> couples = this.wedding.getCouples();

        if (couples.isEmpty())
            return new Couple();

        List<Couple> femaleFilter = couples.stream().filter(couple -> couple.isEqualsTo(SexType.FEMALE)).collect(Collectors.toList());

        if (femaleFilter.isEmpty())
            return new Couple();

        return femaleFilter.get(0);
    }
}
