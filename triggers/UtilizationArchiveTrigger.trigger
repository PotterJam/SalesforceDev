trigger UtilizationArchiveTrigger on Utilization_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
