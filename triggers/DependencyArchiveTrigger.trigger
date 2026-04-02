trigger DependencyArchiveTrigger on Dependency_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
