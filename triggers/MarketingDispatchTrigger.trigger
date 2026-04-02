trigger MarketingDispatchTrigger on Marketing_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
