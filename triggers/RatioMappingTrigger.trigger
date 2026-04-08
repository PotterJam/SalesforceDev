trigger RatioMappingTrigger on Ratio_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioMappingHandler.handleAfterDelete(Trigger.old);
    }
}
