trigger CoverageFlowTrigger on Coverage_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageFlowHandler.handleAfterDelete(Trigger.old);
    }
}
