trigger ApprovalEntryTrigger on Approval_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalEntryHandler.handleAfterDelete(Trigger.old);
    }
}
