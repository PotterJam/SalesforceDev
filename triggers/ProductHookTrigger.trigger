trigger ProductHookTrigger on Product_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductHookHandler.handleAfterDelete(Trigger.old);
    }
}
