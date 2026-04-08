trigger MarketingAdapterTrigger on Marketing_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
