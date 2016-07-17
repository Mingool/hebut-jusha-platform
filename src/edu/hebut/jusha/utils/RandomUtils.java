package edu.hebut.jusha.utils;

import java.util.Random;

public class RandomUtils {

	public static String getRandomNumber(int number) {
		Random random = new Random();
		String str = "";
		for (int i = 0; i < number; i++) {
			int num = random.nextInt(10);
			str = str + num;
		}
		return str;
	}

}
