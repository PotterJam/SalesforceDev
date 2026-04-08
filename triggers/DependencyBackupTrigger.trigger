trigger DependencyBackupTrigger on Dependency_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyBackupHandler.handleAfterDelete(Trigger.old);
    }
}
