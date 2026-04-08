trigger MilestoneBackupTrigger on Milestone_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneBackupHandler.handleAfterDelete(Trigger.old);
    }
}
