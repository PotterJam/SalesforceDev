trigger ProcurementMappingTrigger on Procurement_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementMappingHandler.handleAfterDelete(Trigger.old);
    }
}
