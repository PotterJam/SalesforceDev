trigger AnalyticsMappingTrigger on Analytics_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsMappingHandler.handleAfterDelete(Trigger.old);
    }
}
