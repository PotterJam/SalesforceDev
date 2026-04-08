trigger RangeStreamTrigger on Range_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeStreamHandler.handleAfterDelete(Trigger.old);
    }
}
