@RestResource(urlMapping='/activityJourney/*')
global with sharing class ActivityJourneyRestController {

    @HttpPost
    global static void createActivityJourney(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        Map<String,Object> bodyMap = (Map<String,Object>)JSON.deserializeUntyped(req.requestBody.toString());

        String fromLocation = (String) bodyMap.get('fromLocation');
        String toLocation = (String) bodyMap.get('toLocation');
        String activityDuration = (String) bodyMap.get('activityDuration');
        String driverName = (String) bodyMap.get('driverName');
        String vehicleNumber = (String) bodyMap.get('vehicleNumber');

        Case activityJourneyRecord = new Case();

        RecordType recType = [SELECT Id, Name, SobjectType FROM RecordType WHERE Name = 'Activity Journey'];
        activityJourneyRecord.RecordTypeId = recType.Id;

        activityJourneyRecord.From_Location_Name__c = fromLocation;
        activityJourneyRecord.To_Location_Name__c = toLocation;
        activityJourneyRecord.Activity_Duration__c = Integer.valueOf(activityDuration);
        activityJourneyRecord.Driver_Name__c = driverName;
        activityJourneyRecord.Vehicle_Number__c = vehicleNumber;
        activityJourneyRecord.Activity_Start_Time__c = Datetime.now();
       

        insert activityJourneyRecord;
        System.debug('Activity Journey Id ' + activityJourneyRecord.Id);


        res.responseBody = Blob.valueOf('Activity Journey created successfully');

    }

}
    
