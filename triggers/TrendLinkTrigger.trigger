trigger TrendLinkTrigger on Trend_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendLinkHandler.handleAfterDelete(Trigger.old);
    }
}
