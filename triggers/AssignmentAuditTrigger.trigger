trigger AssignmentAuditTrigger on Assignment_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentAuditHandler.handleAfterDelete(Trigger.old);
    }
}
