trigger ShiftHubTrigger on Shift_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftHubHandler.handleAfterDelete(Trigger.old);
    }
}
