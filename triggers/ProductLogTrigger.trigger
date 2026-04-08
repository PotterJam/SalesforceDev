trigger ProductLogTrigger on Product_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductLogHandler.handleAfterDelete(Trigger.old);
    }
}
