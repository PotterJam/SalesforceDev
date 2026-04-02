trigger VarianceFlowTrigger on Variance_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceFlowHandler.handleAfterDelete(Trigger.old);
    }
}
