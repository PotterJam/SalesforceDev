trigger RiskArchiveTrigger on Risk_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
