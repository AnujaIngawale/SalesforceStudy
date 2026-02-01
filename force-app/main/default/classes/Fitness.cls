public class Fitness {
   // public Integer weight;
   // public Integer height;
    
    public Decimal calculateBMI(Decimal weight, Decimal height){
    
        Decimal bmi = weight/(height*height);
        return bmi;        
    }
    
    public Decimal calculatePace(Decimal distance, Decimal minutes){
    
        Decimal pace = distance/(minutes/60);
        
        return pace;
    
    }
}