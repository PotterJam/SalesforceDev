trigger UtilizationHandlerTrigger on Utilization_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
