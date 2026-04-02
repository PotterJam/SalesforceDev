trigger QualityMappingTrigger on Quality_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityMappingHandler.handleAfterDelete(Trigger.old);
    }
}
