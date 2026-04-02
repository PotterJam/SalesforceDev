trigger ResourceHookTrigger on Resource_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceHookHandler.handleAfterDelete(Trigger.old);
    }
}
