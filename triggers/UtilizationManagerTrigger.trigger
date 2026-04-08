trigger UtilizationManagerTrigger on Utilization_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationManagerHandler.handleAfterDelete(Trigger.old);
    }
}
