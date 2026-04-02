trigger CommissionMappingTrigger on Commission_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionMappingHandler.handleAfterDelete(Trigger.old);
    }
}
