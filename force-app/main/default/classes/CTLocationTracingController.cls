public with sharing class CTLocationTracingController {
    public static List<Location_Tracing__c > getVisitors(String locationId) {
        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c
                FROM Location_Tracing__c 
                WHERE Location__c =: locationId 
                ORDER BY Visit_Date__c DESC];        
    }

    public static List<Location_Tracing__c > getLocationsByPersonIds(Set<Id> personIds) {
        return [SELECT Id, Person__c, Location__c
                FROM Location_Tracing__c 
                WHERE Person__c IN :personIds 
                AND Visit_Date__c = LAST_N_DAYS:10];

    }

    public static List<Location_Tracing__c > getLocationsByLocationIds(Set<Id> locationIds){
        return [SELECT Id, Person__c, Location__c, Visit_Date__c,Person__r.Token__c, Person__r.Health_Status__c
                FROM Location_Tracing__c 
                WHERE Location__c IN :locationIds 
                AND Person__r.Health_Status__c ='Green'
                AND Visit_Date__c = LAST_N_DAYS:10];
    }

    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTraces) {
        //Store unique location Ids
        Set<Id> locationIds = new Set<Id>();

        //Store unique person Ids
        Set<Id> personIds = new Set<Id>();

        for(Location_Tracing__c trace :newLocationTraces){
            locationIds.add(trace.Location__c);
            personIds.add(trace.Person__c);
        }

        //map of locationIds and set of personIds
        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, set<Id>>();

        //query existing location tracing records

        List<Location_Tracing__c > existingRecords = [SELECT Id, Person__c, Location__c, Visit_Date__c,Person__r.Token__c, Person__r.Health_Status__c
                                                        FROM Location_Tracing__c 
                                                        WHERE Location__c IN :locationIds 
                                                        AND Person__c IN :personIds];

        //list of duplicates
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();                                               
                                                         
        if(existingRecords != null && existingRecords.size()>0){
            for(Location_Tracing__c trace :existingRecords){
                String locationId = trace.Location__c;
                String personId = trace.Person__c;
                if(! mapOfExistingRecords.containsKey(locationId)){
                    mapOfExistingRecords.put(locationId,new Set<Id>());
                }

                //get map item using locationId key
                Set<Id> perIds = mapOfExistingRecords.get(locationId);

                //add personIds to the set 
                perIds.add(personId);

                //overwrite the existing map value 
                mapOfExistingRecords.put(locationId, perIds);
            }

            //loop over new location tracing records
            for(Location_Tracing__c trace : newLocationTraces){
                if(mapOfExistingRecords.containsKey(trace.Location__c) && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c)){
                    duplicates.add(trace);
                }
            }
        }

        return duplicates;
    }
}