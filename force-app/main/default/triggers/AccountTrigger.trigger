trigger AccountTrigger on Account (before update){

    if(Trigger.isBefore){
        for(Account acc: Trigger.new){
            if(acc.Rating == 'Cold'){
                acc.Type = 'Prospect';
            }
        }
    }

    // When SLA Serial Number == 1234 then Upsell Opportunity should automatically set to Yes
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Account acc: Trigger.new){
            if(acc.SLASerialNumber__c == '1234'){
                acc.UpsellOpportunity__c = 'Yes';
            
            }
        
        }
    
    }
   
    
}