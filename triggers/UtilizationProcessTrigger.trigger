trigger UtilizationProcessTrigger on Utilization_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationProcessHandler.handleAfterDelete(Trigger.old);
    }
}
