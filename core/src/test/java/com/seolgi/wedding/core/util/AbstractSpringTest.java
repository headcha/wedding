package com.seolgi.wedding.core.util;

import com.seolgi.wedding.core.CoreApplication;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = CoreApplication.class)
public abstract class AbstractSpringTest {

	static {
		if( System.getProperty("env") == null ){
			System.setProperty("spring.profiles.active", "local");
		}
	}
}
