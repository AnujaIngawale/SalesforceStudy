public with sharing class SchoolInformation{

    public static School__c getSchoolByName (String schName){
        School__c sch = [SELECT Id, Name, Class__c, Fee__c, Uniform_Color__c, Computer_Lab__c, Staff_Strength__c, Email__c, Phone_No__c FROM School__c WHERE Name =: schName];
        return sch;
    }
    
    public static List<School__c> getSchoolByUniColor(String uniColor){
        List<School__c> schoolList = [SELECT Id, Name, Class__c, Fee__c, Uniform_Color__c, Computer_Lab__c, Staff_Strength__c, Email__c, Phone_No__c FROM School__c WHERE  Uniform_Color__c INCLUDES (:uniColor)];
        return schoolList;
    }



}