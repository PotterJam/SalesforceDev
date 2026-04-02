trigger ApprovalServiceTrigger on Approval_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalServiceHandler.handleAfterDelete(Trigger.old);
    }
}
