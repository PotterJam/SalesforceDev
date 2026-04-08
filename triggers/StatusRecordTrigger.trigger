trigger StatusRecordTrigger on Status_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRecordHandler.handleAfterDelete(Trigger.old);
    }
}
