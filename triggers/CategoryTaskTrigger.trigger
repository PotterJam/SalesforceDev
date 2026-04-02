trigger CategoryTaskTrigger on Category_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTaskHandler.handleAfterDelete(Trigger.old);
    }
}
