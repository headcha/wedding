package com.cha.kim.wedding.core.gift;

import org.junit.Test;

import java.text.NumberFormat;

import static org.testng.Assert.*;

/**
 * Created by headcha on 2016-10-05.
 */
public class GiftTest {

    @Test
    public void test() {
        long test = 100000000;
        System.out.println(NumberFormat.getInstance().format(test));
    }
}