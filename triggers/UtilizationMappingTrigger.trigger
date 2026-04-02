trigger UtilizationMappingTrigger on Utilization_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationMappingHandler.handleAfterDelete(Trigger.old);
    }
}
