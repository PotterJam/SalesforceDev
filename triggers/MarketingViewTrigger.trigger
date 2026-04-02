trigger MarketingViewTrigger on Marketing_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingViewHandler.handleAfterDelete(Trigger.old);
    }
}
