trigger MarketingRequestTrigger on Marketing_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingRequestHandler.handleAfterDelete(Trigger.old);
    }
}
