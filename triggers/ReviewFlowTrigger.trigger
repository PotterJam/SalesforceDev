trigger ReviewFlowTrigger on Review_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewFlowHandler.handleAfterDelete(Trigger.old);
    }
}
