package com.cha.kim.wedding.admin.invitation;


import com.cha.kim.wedding.admin.api.invitation.wedding.DisplayWedding;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DisplayInvitation {
    private List<DisplayWedding> weddings = new ArrayList<>();
    private long allInvitationCount;
    private long allVisitorCount;
    private long allAccountCount;
    private long sumFundingAmount;
    private long allShareCount;
    private long allGuestCount;
    public double shareCountRate(long invitationShareCount) {
        return ((double) invitationShareCount / (double) allShareCount) * 100;
    }

    public double visitorCountRate(long invitationVisitorCount) {
        return ((double) invitationVisitorCount / (double) allVisitorCount) * 100;
    }

    public double guestCountRate(long invitationGuestCount) {
        return ((double) invitationGuestCount / (double) allGuestCount) * 100;
    }
}
