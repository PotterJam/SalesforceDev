trigger VarianceBridgeTrigger on Variance_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
