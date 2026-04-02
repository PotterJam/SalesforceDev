trigger ApprovalTransformTrigger on Approval_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTransformHandler.handleAfterDelete(Trigger.old);
    }
}
