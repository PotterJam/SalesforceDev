trigger UtilizationEntryTrigger on Utilization_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationEntryHandler.handleAfterDelete(Trigger.old);
    }
}
