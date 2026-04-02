trigger DeliverableBackupTrigger on Deliverable_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBackupHandler.handleAfterDelete(Trigger.old);
    }
}
