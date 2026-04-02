trigger MarketingDetailTrigger on Marketing_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingDetailHandler.handleAfterDelete(Trigger.old);
    }
}
