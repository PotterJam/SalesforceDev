trigger ApprovalDetailTrigger on Approval_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalDetailHandler.handleAfterDelete(Trigger.old);
    }
}
