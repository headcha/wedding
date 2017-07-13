//package com.cha.kim.wedding.core.invitation.wedding;
//
//import com.cha.kim.wedding.core.util.AbstractSpringTest;
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.ArrayList;
//import java.util.Date;
//
//@Transactional
//public class WeddingRepositoryTest extends AbstractSpringTest {
//    @Autowired
//    private WeddingRepository weddingRepository;
//
//    @Test
//    public void testAdd() {
//        Wedding wedding = Wedding.builder().couples(new ArrayList<>()).city("test").title("test").country("test").weddingDate(new Date()).introduction("test").build();
//        weddingRepository.save(wedding);
//    }
//
//}