trigger CategoryHookTrigger on Category_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryHookHandler.handleAfterDelete(Trigger.old);
    }
}
