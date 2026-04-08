trigger ResearchHookTrigger on Research_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchHookHandler.handleAfterDelete(Trigger.old);
    }
}
