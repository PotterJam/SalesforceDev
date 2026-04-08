trigger UtilizationFlowTrigger on Utilization_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationFlowHandler.handleAfterDelete(Trigger.old);
    }
}
