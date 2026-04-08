trigger TagRecordTrigger on Tag_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRecordHandler.handleAfterDelete(Trigger.old);
    }
}
