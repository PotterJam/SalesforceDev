trigger ResearchTriggerTrigger on Research_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
