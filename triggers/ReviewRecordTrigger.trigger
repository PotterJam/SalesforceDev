trigger ReviewRecordTrigger on Review_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRecordHandler.handleAfterDelete(Trigger.old);
    }
}
