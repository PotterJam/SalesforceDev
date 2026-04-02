trigger LeadFlowTrigger on Lead_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadFlowHandler.handleAfterDelete(Trigger.old);
    }
}
