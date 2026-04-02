trigger UtilizationTaskTrigger on Utilization_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTaskHandler.handleAfterDelete(Trigger.old);
    }
}
