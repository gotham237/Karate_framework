package features.utils;

import com.github.javafaker.Faker;

public class RandomDataGenerator {

    public static String getRandomInteger(int size) {
        Faker faker = new Faker();
        return faker.number().digits(size);
    }
    // just to test how to import java function to the karate test
    public static String getRandomEmail() {
        return getRandomInteger(5) + "@gmail.com";
    }
}
