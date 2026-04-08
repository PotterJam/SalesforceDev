trigger ApprovalFilterTrigger on Approval_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalFilterHandler.handleAfterDelete(Trigger.old);
    }
}
