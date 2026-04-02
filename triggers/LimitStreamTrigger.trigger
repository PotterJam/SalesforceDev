trigger LimitStreamTrigger on Limit_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitStreamHandler.handleAfterDelete(Trigger.old);
    }
}
