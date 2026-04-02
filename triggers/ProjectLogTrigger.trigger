trigger ProjectLogTrigger on Project_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectLogHandler.handleAfterDelete(Trigger.old);
    }
}
