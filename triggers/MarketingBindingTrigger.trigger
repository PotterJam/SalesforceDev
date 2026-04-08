trigger MarketingBindingTrigger on Marketing_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingBindingHandler.handleAfterDelete(Trigger.old);
    }
}
