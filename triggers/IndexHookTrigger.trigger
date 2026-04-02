trigger IndexHookTrigger on Index_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexHookHandler.handleAfterDelete(Trigger.old);
    }
}
