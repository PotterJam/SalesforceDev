trigger MarketingManagerTrigger on Marketing_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingManagerHandler.handleAfterDelete(Trigger.old);
    }
}
