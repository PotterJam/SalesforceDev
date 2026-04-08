trigger FinanceBridgeTrigger on Finance_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
