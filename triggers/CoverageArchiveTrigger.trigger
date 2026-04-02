trigger CoverageArchiveTrigger on Coverage_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
