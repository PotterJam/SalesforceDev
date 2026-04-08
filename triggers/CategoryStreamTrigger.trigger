trigger CategoryStreamTrigger on Category_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryStreamHandler.handleAfterDelete(Trigger.old);
    }
}
