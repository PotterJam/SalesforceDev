trigger ResolutionHookTrigger on Resolution_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionHookHandler.handleAfterDelete(Trigger.old);
    }
}
