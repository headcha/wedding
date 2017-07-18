package com.seolgi.wedding.core.share;

import com.seolgi.wedding.core.util.AbstractSpringTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ShareRepositoryTest extends AbstractSpringTest {

    @Autowired
    private ShareRepository sut;

    @Test
    public void testCountByWeddingId() throws Exception {
        sut.countByWeddingId(1);
    }

}