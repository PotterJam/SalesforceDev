trigger ShiftBridgeTrigger on Shift_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
