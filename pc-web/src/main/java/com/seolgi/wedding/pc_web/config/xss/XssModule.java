package com.seolgi.wedding.pc_web.config.xss;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.navercorp.lucy.security.xss.servletfilter.defender.XssPreventerDefender;
import com.nhncorp.lucy.security.xss.XssFilter;
import com.nhncorp.lucy.security.xss.XssPreventer;

import java.io.IOException;

public class XssModule extends SimpleModule {

	public XssModule() {
		super();

		addDeserializer(String.class, new XssDeserializer());
	}

	private class XssDeserializer extends JsonDeserializer<String> {

		@Override
		public String deserialize(JsonParser jsonParser, DeserializationContext context) throws IOException {
			String value = jsonParser.getValueAsString();
			return XssFilter.getInstance().doFilter(value);
		}
	}
}
