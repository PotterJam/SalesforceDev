trigger RangeRecordTrigger on Range_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeRecordHandler.handleAfterDelete(Trigger.old);
    }
}
