trigger ResolutionFlowTrigger on Resolution_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionFlowHandler.handleAfterDelete(Trigger.old);
    }
}
