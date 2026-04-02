trigger ApprovalFeedTrigger on Approval_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalFeedHandler.handleAfterDelete(Trigger.old);
    }
}
