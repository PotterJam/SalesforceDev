trigger MarketingMappingTrigger on Marketing_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingMappingHandler.handleAfterDelete(Trigger.old);
    }
}
