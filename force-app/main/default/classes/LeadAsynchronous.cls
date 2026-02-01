public class LeadAsynchronous {
    
    @future
    public static void updateLeadRecord(Set<Id> existingRecordIds){
        List<Lead> existingRecords = [SELECT Id,LeadSource FROM Lead WHERE Id IN :existingRecordIds];
        for(Lead record : existingRecords) {
            record.LeadSource = 'Web';
        }
        update existingRecords;
    }
    
    @future
    public static void createLeadRecord(){
        Lead anotherLead = new Lead(LastName='Test Lead Single',Status='Open - Not Contacted',Company='SFDCFacts');
        insert anotherLead;
    }
}