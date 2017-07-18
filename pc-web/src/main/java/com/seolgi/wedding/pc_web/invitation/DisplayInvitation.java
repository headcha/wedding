package com.seolgi.wedding.pc_web.invitation;


import com.seolgi.wedding.pc_web.api.invitation.wedding.DisplayWedding;
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

}
