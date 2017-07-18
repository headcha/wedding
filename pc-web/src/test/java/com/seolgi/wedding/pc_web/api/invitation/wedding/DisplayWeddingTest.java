package com.seolgi.wedding.pc_web.api.invitation.wedding;

import com.seolgi.wedding.core.invitation.wedding.Wedding;
import org.junit.Test;

import java.util.Calendar;
import java.util.Date;

import static org.assertj.core.api.Assertions.*;


public class DisplayWeddingTest {

    @Test
    public void testGetDDayRate() throws Exception {
        Calendar createDate = Calendar.getInstance();
        createDate.set(2016, 6 - 1, 18);


        Wedding wedding = Wedding.builder().createDate(createDate.getTime()).weddingDate(new Date()).build();

        DisplayWedding displayWedding = DisplayWedding.create(wedding);
        assertThat(displayWedding.getDDayRate()).isLessThanOrEqualTo(100);
        assertThat(displayWedding.getDDate()).isEqualTo(0);
    }

    @Test
    public void testGetDDayRate_결혼날짜가null이라면_0() throws Exception {
        Calendar createDate = Calendar.getInstance();
        createDate.set(2016, 6 - 1, 18);


        Wedding wedding = Wedding.builder().createDate(createDate.getTime()).build();

        DisplayWedding displayWedding = DisplayWedding.create(wedding);
        assertThat(displayWedding.getDDayRate()).isLessThanOrEqualTo(100);
        assertThat(displayWedding.getDDate()).isEqualTo(0);
    }
}