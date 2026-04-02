trigger UtilizationHubTrigger on Utilization_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationHubHandler.handleAfterDelete(Trigger.old);
    }
}
