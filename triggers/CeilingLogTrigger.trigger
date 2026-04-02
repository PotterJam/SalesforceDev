trigger CeilingLogTrigger on Ceiling_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingLogHandler.handleAfterDelete(Trigger.old);
    }
}
