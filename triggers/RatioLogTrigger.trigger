trigger RatioLogTrigger on Ratio_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioLogHandler.handleAfterDelete(Trigger.old);
    }
}
