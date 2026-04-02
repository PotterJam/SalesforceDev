trigger GradeBackupTrigger on Grade_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBackupHandler.handleAfterDelete(Trigger.old);
    }
}
