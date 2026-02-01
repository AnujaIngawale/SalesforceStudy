//here class name is Constructor

public class Constructor {
    public Integer recoveredInArea = 0 ; 
    public Integer recoveredInCountry = 0 ;
    
    //Initialization block
    
    {
        System.debug('Initialization');
        recoveredInArea = 5;
        RecoveredInCountry = 5;
    }
    
    public Constructor(){
        System.debug('Constructor is called');
    }
    
    public Constructor(Integer recoveredInArea){
        this();
        this.recoveredInArea = recoveredInArea;
        recoveredInCountry = recoveredInArea;
        
        
    }



}