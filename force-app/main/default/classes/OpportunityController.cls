public class OpportunityController {
    public static void updateProfile(List<Id> oppIds){
        //get op record in a list
        List<Opportunity> opps = [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id IN: oppIds];
        for(Opportunity op : opps){
            if(op.Amount == null){
                op.Profile__c = '';
            } else if(op.Amount <10000){
                op.Profile__c = 'Low';
            } else if(op.Amount > 50000){
                op.Profile__c = 'High';
            } else{
                op.Profile__c = 'Medium';
            }
        }
        update opps;
    }
}