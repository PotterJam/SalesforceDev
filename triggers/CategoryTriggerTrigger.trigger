trigger CategoryTriggerTrigger on Category_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
