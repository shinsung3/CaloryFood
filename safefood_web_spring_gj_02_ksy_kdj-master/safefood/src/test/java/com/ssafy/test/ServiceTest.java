package com.ssafy.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.ssafy.config.ApplicationConfig;
import com.ssafy.model.dto.Food;
import com.ssafy.model.service.FoodService;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class})
public class ServiceTest {

	@Autowired
	FoodService service;

	@Test
	public void test() {
		List<Food> f = service.selectAll();
		assertThat(f, is(notNullValue()));
		assertThat(service, is(notNullValue()));
	}

}
