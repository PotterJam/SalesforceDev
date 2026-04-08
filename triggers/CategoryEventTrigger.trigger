trigger CategoryEventTrigger on Category_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryEventHandler.handleAfterDelete(Trigger.old);
    }
}
