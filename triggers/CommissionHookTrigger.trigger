trigger CommissionHookTrigger on Commission_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionHookHandler.handleAfterDelete(Trigger.old);
    }
}
