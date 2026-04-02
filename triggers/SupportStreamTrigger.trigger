trigger SupportStreamTrigger on Support_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportStreamHandler.handleAfterDelete(Trigger.old);
    }
}
