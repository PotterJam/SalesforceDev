trigger SupportFlowTrigger on Support_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportFlowHandler.handleAfterDelete(Trigger.old);
    }
}
