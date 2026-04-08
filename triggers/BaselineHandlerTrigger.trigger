trigger BaselineHandlerTrigger on Baseline_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
