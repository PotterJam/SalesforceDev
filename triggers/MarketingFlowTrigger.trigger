trigger MarketingFlowTrigger on Marketing_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingFlowHandler.handleAfterDelete(Trigger.old);
    }
}
