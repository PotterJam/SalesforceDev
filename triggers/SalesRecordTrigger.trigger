trigger SalesRecordTrigger on Sales_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRecordHandler.handleAfterDelete(Trigger.old);
    }
}
