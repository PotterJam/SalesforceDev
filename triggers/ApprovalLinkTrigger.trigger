trigger ApprovalLinkTrigger on Approval_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalLinkHandler.handleAfterDelete(Trigger.old);
    }
}
