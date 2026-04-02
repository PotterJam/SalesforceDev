trigger UtilizationJobTrigger on Utilization_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationJobHandler.handleAfterDelete(Trigger.old);
    }
}
