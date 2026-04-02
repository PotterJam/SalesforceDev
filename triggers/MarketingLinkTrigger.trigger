trigger MarketingLinkTrigger on Marketing_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingLinkHandler.handleAfterDelete(Trigger.old);
    }
}
