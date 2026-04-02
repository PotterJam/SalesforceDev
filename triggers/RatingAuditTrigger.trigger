trigger RatingAuditTrigger on Rating_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingAuditHandler.handleAfterDelete(Trigger.old);
    }
}
