trigger ApprovalViewTrigger on Approval_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalViewHandler.handleAfterDelete(Trigger.old);
    }
}
