trigger LimitJobTrigger on Limit_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitJobHandler.handleAfterDelete(Trigger.old);
    }
}
