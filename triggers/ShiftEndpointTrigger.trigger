trigger ShiftEndpointTrigger on Shift_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
