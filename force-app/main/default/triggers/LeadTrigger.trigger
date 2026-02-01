trigger LeadTrigger on Lead (before insert,after insert, before update, after update) {
    switch on Trigger.operationType {
        When BEFORE_INSERT{
            LeadTriggerHandler.beforeInsertHandler(Trigger.new);
        }
        WHEN AFTER_INSERT {
           LeadTriggerHandler.afterInsertHandler(Trigger.new);
        }
        When BEFORE_UPDATE{
            LeadTriggerHandler.beforeUpdateHandler(Trigger.new, Trigger.oldMap);
        }
    }
}