trigger ApprovalTriggerTrigger on Approval_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
