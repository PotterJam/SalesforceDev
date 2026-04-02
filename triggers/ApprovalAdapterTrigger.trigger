trigger ApprovalAdapterTrigger on Approval_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
