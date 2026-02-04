public with sharing class ActivityJourneyController {
    
    @AuraEnabled(cacheable=true)
    public static ActivityJourneyData getAllActivityJourneys(){

        List<Case> activityJourneys = [SELECT Id,RecordType.Name, From_Location_Name__c, To_Location_Name__c,Driver_Name__c,Vehicle_Number__c, Activity_Duration__c, 
                                        (SELECT Id, Activity_Start_Time__c, Activity_End_Time__c, Activity_Duration__c, Activity_Journey__c FROM FatigueCases__r),
                                        (SELECT Id, Location_Name__c, Location_LatLong__c, Activity_Journey__c FROM Activity_Location_Journeys__r ORDER BY CreatedDate ASC)
                                        FROM Case 
                                        WHERE RecordType.Name = 'Activity Journey'
                                        ORDER BY Activity_Start_Time__c DESC];

        ActivityJourneyData data = new ActivityJourneyData();
        data.allActivityJourneys = new List<ActivityJourneyData.ActivityJourneyModel>();

        for(Case journey:activityJourneys){
            ActivityJourneyData.ActivityJourneyModel model = new ActivityJourneyData.ActivityJourneyModel();

            model.caseId = journey.Id;
            model.toLocation = journey.To_Location_Name__c;
            model.fromLocation = journey.From_Location_Name__c;
            model.activityDuration = String.valueOf(journey.Activity_Duration__c);
            model.driverName = journey.Driver_Name__c;
            model.vehicleNumber = journey.Vehicle_Number__c;

            List<ActivityJourneyData.FatigueCase> fatigueCases = new List<ActivityJourneyData.FatigueCase>();
            for(Case fatigue:journey.FatigueCases__r){
                ActivityJourneyData.FatigueCase fatigueCase = new ActivityJourneyData.FatigueCase();
                fatigueCase.fatigueCaseId = fatigue.Id;
                fatigueCase.startTime = fatigue.Activity_Start_Time__c;
                fatigueCase.endTime = fatigue.Activity_End_Time__c;
                fatigueCase.duration = String.valueOf(fatigue.Activity_Duration__c);
                fatigueCase.activityJourneyId = fatigue.Activity_Journey__c;
                fatigueCases.add(fatigueCase);
            }
            model.fatigueCases = fatigueCases;

            List<ActivityJourneyData.JourneyLocation> journeyLocations = new List<ActivityJourneyData.JourneyLocation>();
            for(Location_Journey__c location:    journey.Activity_Location_Journeys__r){
                ActivityJourneyData.JourneyLocation journeyLocation = new ActivityJourneyData.JourneyLocation();

                journeyLocation.journeyLocationId = location.Id;     
                journeyLocation.locationName = location.Location_Name__c;
                //journeyLocation.locationLatLong = location.Location_LatLong__c;
                journeyLocation.activityJourneyId = location.Activity_Journey__c;

                journeyLocations.add(journeyLocation);
            }
            model.journeyLocations = journeyLocations;

            data.allActivityJourneys.add(model);
        }
        return data;
    }
}