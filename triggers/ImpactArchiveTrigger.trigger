trigger ImpactArchiveTrigger on Impact_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
