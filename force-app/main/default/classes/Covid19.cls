/* Covid 19 class 
   Track Covid 19 recovery
   
*/

public class Covid19{
    public Integer recoveredInArea = 0;
    public static Integer recoveredInCountry = 0;
    
    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }
    
    public static void printTreated(){
        System.debug('Recovered in country : '+recoveredInCountry);
    }

}