package com.cha.kim.wedding.admin.api.invitation.wedding;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import org.junit.Test;

import java.util.Calendar;
import java.util.Date;

import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;
import static org.mockito.Matchers.*;
import static org.mockito.BDDMockito.*;


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