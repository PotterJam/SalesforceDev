trigger MarketingNodeTrigger on Marketing_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingNodeHandler.handleAfterDelete(Trigger.old);
    }
}
