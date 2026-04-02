trigger RatioJobTrigger on Ratio_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioJobHandler.handleAfterDelete(Trigger.old);
    }
}
