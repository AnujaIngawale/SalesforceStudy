public with sharing class ActivityJourneyData {

    @AuraEnabled public List<ActivityJourneyModel> allActivityJourneys; 
   
    public class ActivityJourneyModel {

        @AuraEnabled public String caseId;
        @AuraEnabled public String toLocation;
        @AuraEnabled public String fromLocation;
        @AuraEnabled public String activityDuration;
        @AuraEnabled public String driverName;
        @AuraEnabled public String vehicleNumber;

        @AuraEnabled public List<FatigueCase> fatigueCases;
        @AuraEnabled public List<JourneyLocation> journeyLocations;
        
    }
    
    public class FatigueCase {
        @AuraEnabled public String fatigueCaseId;
        @AuraEnabled public String fatigueLocation;
        @AuraEnabled public Datetime startTime;
        @AuraEnabled public Datetime endTime;
        @AuraEnabled public String duration;
        @AuraEnabled public String activityJourneyId;
    }

    public class JourneyLocation {
        @AuraEnabled public String journeyLocationId;
        @AuraEnabled public String locationName;
        @AuraEnabled public String locationLatLong;
        @AuraEnabled public String activityJourneyId;
    }


}