trigger OrderStreamTrigger on Order_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderStreamHandler.handleAfterDelete(Trigger.old);
    }
}
