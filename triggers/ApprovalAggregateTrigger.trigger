trigger ApprovalAggregateTrigger on Approval_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
