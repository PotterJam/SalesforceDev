trigger ShiftRegistryTrigger on Shift_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
