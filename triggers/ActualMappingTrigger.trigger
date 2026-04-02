trigger ActualMappingTrigger on Actual_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualMappingHandler.handleAfterDelete(Trigger.old);
    }
}
