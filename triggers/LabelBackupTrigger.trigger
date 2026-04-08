trigger LabelBackupTrigger on Label_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBackupHandler.handleAfterDelete(Trigger.old);
    }
}
