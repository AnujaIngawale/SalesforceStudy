public with sharing class BasicMathematics {

    // addition
    public static Integer doAddition(Integer num1, Integer num2){
        Integer addition = num1 + num2;
        return addition;
    }
    
    // substraction
    
    public static Integer doSubstraction(Integer num1, Integer num2){
    
        if(num1>num2){
            Integer substraction = num1 - num2;
            return substraction;
        } else {
            Integer substraction = num2 - num1;
            return substraction;
        }
        
    }
    
    // division
    
    public static double doDivision(double num1, double num2){
    
        double division =  Decimal.valueOf((num1/num2)).setScale(3);
        return division;
      /*  if(num1>num2){
            Integer division = num2/num1;
            return division;
        } else {
            Integer division = num1/num2;
            return division;
        }*/
    }
    
    // multiplication
    
    public static integer doMultiplication(integer num1, integer num2){
    
        integer multiplication = num1*num2;
        return multiplication;
    }
    

}