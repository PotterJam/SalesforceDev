trigger UtilizationTriggerTrigger on Utilization_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
