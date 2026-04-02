trigger UtilizationDispatchTrigger on Utilization_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
