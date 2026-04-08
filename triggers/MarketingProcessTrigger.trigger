trigger MarketingProcessTrigger on Marketing_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingProcessHandler.handleAfterDelete(Trigger.old);
    }
}
