trigger ActualRecordTrigger on Actual_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualRecordHandler.handleAfterDelete(Trigger.old);
    }
}
