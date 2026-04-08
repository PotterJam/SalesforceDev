trigger StatusHookTrigger on Status_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusHookHandler.handleAfterDelete(Trigger.old);
    }
}
