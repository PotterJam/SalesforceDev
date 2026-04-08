trigger UtilizationLogTrigger on Utilization_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationLogHandler.handleAfterDelete(Trigger.old);
    }
}
