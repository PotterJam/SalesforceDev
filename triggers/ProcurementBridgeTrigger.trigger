trigger ProcurementBridgeTrigger on Procurement_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
