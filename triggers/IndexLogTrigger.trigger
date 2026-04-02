trigger IndexLogTrigger on Index_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexLogHandler.handleAfterDelete(Trigger.old);
    }
}
