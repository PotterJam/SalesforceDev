trigger LimitLogTrigger on Limit_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitLogHandler.handleAfterDelete(Trigger.old);
    }
}
