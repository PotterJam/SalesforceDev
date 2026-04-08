trigger ShiftPluginTrigger on Shift_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftPluginHandler.handleAfterDelete(Trigger.old);
    }
}
