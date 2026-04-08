trigger CommissionFlowTrigger on Commission_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionFlowHandler.handleAfterDelete(Trigger.old);
    }
}
