trigger ActualPolicyTrigger on Actual_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
