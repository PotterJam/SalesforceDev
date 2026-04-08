trigger CategoryRecordTrigger on Category_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryRecordHandler.handleAfterDelete(Trigger.old);
    }
}
