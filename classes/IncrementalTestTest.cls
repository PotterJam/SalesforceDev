@isTest
public class IncrementalTestTest {
	@isTest
    public static void testGetRandomNumber() {
        IncrementalTest test = new IncrementalTest();
        System.assertEquals(test.RandomNumber(), 5);
    }
}