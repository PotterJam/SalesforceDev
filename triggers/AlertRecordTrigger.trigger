trigger AlertRecordTrigger on Alert_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRecordHandler.handleAfterDelete(Trigger.old);
    }
}
