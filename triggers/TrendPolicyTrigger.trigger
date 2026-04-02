trigger TrendPolicyTrigger on Trend_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
