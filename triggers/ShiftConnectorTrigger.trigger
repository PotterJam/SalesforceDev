trigger ShiftConnectorTrigger on Shift_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
