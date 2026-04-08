trigger MarketingModelTrigger on Marketing_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingModelHandler.handleAfterDelete(Trigger.old);
    }
}
