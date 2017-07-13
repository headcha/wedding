package com.cha.kim.wedding.core.util;

import com.cha.kim.wedding.core.config.CoreApplicationConfig;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = CoreApplicationConfig.class)
public abstract class AbstractSpringTest {

	static {
		if( System.getProperty("env") == null ){
			System.setProperty("env", "local");
		}
	}
}
