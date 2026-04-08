trigger RatioTaskTrigger on Ratio_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTaskHandler.handleAfterDelete(Trigger.old);
    }
}
