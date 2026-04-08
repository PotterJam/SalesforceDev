trigger RangeLogTrigger on Range_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeLogHandler.handleAfterDelete(Trigger.old);
    }
}
