trigger ChannelBackupTrigger on Channel_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelBackupHandler.handleAfterDelete(Trigger.old);
    }
}
