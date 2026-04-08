trigger MarketingActionTrigger on Marketing_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingActionHandler.handleAfterDelete(Trigger.old);
    }
}
