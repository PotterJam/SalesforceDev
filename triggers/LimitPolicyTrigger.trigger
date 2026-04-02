trigger LimitPolicyTrigger on Limit_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
