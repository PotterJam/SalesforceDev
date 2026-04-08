trigger LevelAuditTrigger on Level_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelAuditHandler.handleAfterDelete(Trigger.old);
    }
}
