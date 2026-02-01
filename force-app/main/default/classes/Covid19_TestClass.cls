public class Covid19_TestClass{
    private Integer recoveredInArea = 0 ;
    public static Integer recoveredInCountry = 0;
    
    //parameterized constructor to set class variable value
    public Covid19_TestClass(Integer recoveredInArea) {
        if(recoveredInArea < 0){
            this.recoveredInArea = 0;
        }else{
            this.recoveredInArea = recoveredInArea;
            recoveredInCountry += recoveredInArea;
        }
    }
    
    public void treatPatient(){
        recoveredInArea++ ;
        recoveredInCountry++ ; 
    }
    
    public Integer getTreated(){
        return recoveredInArea;
    }
}