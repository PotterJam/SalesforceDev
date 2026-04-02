trigger ApprovalRecordTrigger on Approval_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRecordHandler.handleAfterDelete(Trigger.old);
    }
}
