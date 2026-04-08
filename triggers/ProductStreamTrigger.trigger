trigger ProductStreamTrigger on Product_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductStreamHandler.handleAfterDelete(Trigger.old);
    }
}
