package com.cha.kim.wedding.web.config.helper;

import com.github.jknack.handlebars.Helper;
import com.github.jknack.handlebars.Options;

import java.io.IOException;
import java.util.Objects;

public class EvenHelper implements Helper<Object> {
    @Override
    public CharSequence apply(Object object, Options options) throws IOException {
        Integer value = (Integer) object;

        return ( value % 2 ) == 0 ? options.fn() : options.inverse();
    }
}
