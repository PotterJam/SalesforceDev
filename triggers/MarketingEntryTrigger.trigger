trigger MarketingEntryTrigger on Marketing_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingEntryHandler.handleAfterDelete(Trigger.old);
    }
}
