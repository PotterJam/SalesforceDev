trigger CommissionArchiveTrigger on Commission_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
