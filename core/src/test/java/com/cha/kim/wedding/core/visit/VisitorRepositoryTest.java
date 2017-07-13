//package com.cha.kim.wedding.core.visit;
//
//import com.cha.kim.wedding.core.invitation.wedding.Wedding;
//import com.cha.kim.wedding.core.util.AbstractSpringTest;
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.Date;
//
//@Transactional
//public class VisitorRepositoryTest extends AbstractSpringTest {
//
//    @Autowired
//    private VisitorRepository sut;
//
//    @Test
//    public void testSave() {
//        sut.save(Visitor.builder().sessionId("test1").wedding(Wedding.builder().id(9).build()).build());
//    }
//
//    @Test
//    public void testCountByWeddingId() {
//        sut.countByWeddingId(9);
//    }
//}