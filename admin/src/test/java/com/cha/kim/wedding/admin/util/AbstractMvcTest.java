package com.cha.kim.wedding.admin.util;

import com.cha.kim.wedding.admin.config.AdminApplicationConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AdminApplicationConfig.class)
@WebAppConfiguration
public abstract class AbstractMvcTest<T> {
	@Autowired
	private WebApplicationContext webApplicationContext;
	protected MockMvc mockMvc;

	protected ObjectMapper objectMapper = new ObjectMapper();

	protected void initMvc(T t) {
		mockMvc = MockMvcBuilders.standaloneSetup(t).build();
	}
}
