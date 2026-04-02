trigger CustomerRecordTrigger on Customer_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRecordHandler.handleAfterDelete(Trigger.old);
    }
}
