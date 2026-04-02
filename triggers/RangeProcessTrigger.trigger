trigger RangeProcessTrigger on Range_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeProcessHandler.handleAfterDelete(Trigger.old);
    }
}
