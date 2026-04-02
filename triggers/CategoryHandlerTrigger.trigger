trigger CategoryHandlerTrigger on Category_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
