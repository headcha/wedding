package com.seolgi.wedding.pc_web.util;

import com.seolgi.wedding.pc_web.config.PcWebApplicationConfig;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = PcWebApplicationConfig.class)
@WebAppConfiguration
public abstract class AbstractSpringTest {

	static {
		if( System.getProperty("env") == null ){
			System.setProperty("env", "local");
		}
	}
}

