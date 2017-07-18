package com.seolgi.wedding.pc_web.util;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

public class RestTemplateFactory {

    private static RestTemplate restTemplate;
    private RestTemplateFactory(){}



    public static RestTemplate getInstance() {
        if (restTemplate != null)
            return restTemplate;

        restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(clientHttpRequestFactory());

        restTemplate.getMessageConverters().stream().filter(converter -> converter instanceof MappingJackson2HttpMessageConverter).forEach(converter -> {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            MappingJackson2HttpMessageConverter jsonConverter = (MappingJackson2HttpMessageConverter) converter;
            jsonConverter.setObjectMapper(objectMapper);
        });

        return restTemplate;
    }

    private static ClientHttpRequestFactory clientHttpRequestFactory() {
        HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
        factory.setConnectTimeout(3000);
        return factory;
    }
}
