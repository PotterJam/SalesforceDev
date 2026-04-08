trigger ResourceLogTrigger on Resource_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceLogHandler.handleAfterDelete(Trigger.old);
    }
}
