trigger CustomerHookTrigger on Customer_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerHookHandler.handleAfterDelete(Trigger.old);
    }
}
