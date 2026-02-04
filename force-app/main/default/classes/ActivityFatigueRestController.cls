@RestResource(urlMapping='/activityFatigue/*')
global with sharing class ActivityFatigueRestController {
    @HttpPost
    global static void createActivityFatigue(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        Map<String,Object> bodyMap = (Map<String,Object>)JSON.deserializeUntyped(req.requestBody.toString());


        String fatigueLocation = (String) bodyMap.get('fatigueLocation');
        String startTimeStr = (String) bodyMap.get('startTime');
        String endTimeStr = (String) bodyMap.get('endTime');
        String activityDuration = (String) bodyMap.get('activityDuration');
        String activityJourney = (String) bodyMap.get('activityJourney');

        Datetime startTime = Datetime.valueOf(startTimeStr.replace('T', ' '));
        Datetime endTime   = Datetime.valueOf(endTimeStr.replace('T', ' '));

        Case activityFatigueRecord = new Case();

        RecordType recType = [SELECT Id, Name, SobjectType FROM RecordType WHERE Name = 'Activity Fatigue Management'];
        activityFatigueRecord.RecordTypeId = recType.Id;

        activityFatigueRecord.Fatigue_Location__c = fatigueLocation;
        activityFatigueRecord.Activity_Start_Time__c = startTime;
        activityFatigueRecord.Activity_End_Time__c = endTime;
        activityFatigueRecord.Activity_Duration__c = Integer.valueOf(activityDuration);
        activityFatigueRecord.Activity_Journey__c = activityJourney;
        //activityFatigueRecord.Journey_Record_Type__c = 'Fatigue';

        insert activityFatigueRecord;
        System.debug('Activity Fatigue Id ' + activityFatigueRecord.Id);


        res.responseBody = Blob.valueOf('Activity Fatigue created successfully');
        
}
}