public class helloWorld {
    
   // private String greeting = 'Hello world';
   //public variable
    public String publicGreeting = 'My public greeting variable';
    public String varFromVSCode = 'Variable from VS Code Auto Save';
   /* 
    private String goodMorning = 'Good Morning';
    private String goodAfternoon = 'Good Afternoon';
    private String goodEvening = 'Good Evening';
    */
    
   /*
    public void printGreeting(){
        System.debug(greeting);
    }
    
        
    public void printGoodMorning(){
        System.debug(goodMorning);
    }
        
    public void printGoodAfternoon(){
        System.debug(goodAfternoon );
    }
        
    public void printGoodEvening(){
        System.debug(goodEvening );
    }
    */
    
    public void printMessage(String msg){
        System.debug(msg);
    }
    
    
    
     public String getDay(Integer dayNumber){
        String dayString = ' ';
        
        switch on dayNumber{
            when 0{
                dayString = 'Monday';
            }
            when 1{
                dayString = 'Tuesday';
            }
            when 2{
                dayString = 'Wednesday';
            }
            when 3{
                dayString = 'Thursday';
            }
            when 4{
                dayString = 'Friday';
            }
            when 5{
                dayString = 'Saturday';
            }
            when 6{
                dayString = 'Sunday';
            }
            when else{
                dayString = 'Invalid day number';
            }
        }
        
        return dayString;
    
    }
    
    //Polymorphic Method : Same method name but different parameters
    
    public String getDay(String dayAbbreviation){
        String dayString = ' ';
        
        switch on dayAbbreviation{
            when 'Mon'{
                dayString = 'Monday';
            }
            when 'Tue'{
                dayString = 'Tuesday';
            }
            when 'Wed'{
                dayString = 'Wednesday';
            }
            when 'Thur'{
                dayString = 'Thursday';
            }
            when 'Fri'{
                dayString = 'Friday';
            }
            when 'Sat'{
                dayString = 'Saturday';
            }
            when 'Sun'{
                dayString = 'Sunday';
            }
            when else{
                dayString = 'Invalid day abbreviation';
            }
        }
        
        return dayString;
    
    }
    
    //get an error about access modifier
    /*global void printPublicGreeting(){
        System.debug(publicGreeting);
    }*/

}