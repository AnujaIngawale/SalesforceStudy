@isTest 
public class Covid19Test {
    
    @isTest
    public static void treatPatientTest(){
        //create the instance of the class
        Covid19_TestClass jaipur = new Covid19_TestClass(10);
        
        //check if the count is 10 or not
        System.assertEquals(10, jaipur.getTreated(), 'Treated count does not match');   
        
         //create the instance of the class
        Covid19_TestClass hyd = new Covid19_TestClass(112);
        
        //check if the count is 10 or not
        System.assertEquals(112, hyd.getTreated(), 'Treated count does not match'); 
        
        //check the count of recoveredInCountry, is should be 122
        System.assertEquals(122, Covid19_TestClass.recoveredInCountry, 'Treated count does not match'); 
        
        jaipur.treatPatient();
        Integer treated = jaipur.getTreated();
        System.assert(treated == 11,'Treated count does not match');
        System.assert(Covid19_TestClass.recoveredInCountry == 123,'Treated count does not match');
    }
    
     @isTest
    public static void treatPatientTestNegative(){
        //create the instance of the class
        Covid19_TestClass jaipur = new Covid19_TestClass(-10);
        
        //check if the count is 0 or not
        System.assertEquals(0, jaipur.getTreated(), 'Treated count does not match');   
    }
}