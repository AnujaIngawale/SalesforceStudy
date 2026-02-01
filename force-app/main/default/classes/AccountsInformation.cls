public with sharing class AccountsInformation {

    public static Account getAccountByName(String accName){
        Account acc = [SELECT Id, Name, Phone, Rating FROM Account WHERE Name=:accName LIMIT 1];
        return acc;
    }
    
    // get Account by Rating
    
    public static Account changeAccountPhone(String accName, String newPhoneNumber){
         Account acc = [SELECT Id, Name, Phone, Rating FROM Account WHERE Name=:accName LIMIT 1];
         acc.Phone = newPhoneNumber;
         update acc;
         return acc;   
    }
    
    // change Account's Rating to cold 
    
    public static Account changeAccountRating(String accName, String AccRating){
        Account acc = [SELECT Id, Name, Phone, Rating FROM Account WHERE Name=:accName LIMIT 1];
        acc.Rating = AccRating;
        update acc;
        return acc;
    }

}