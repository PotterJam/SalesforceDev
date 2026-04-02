trigger BaselinePolicyTrigger on Baseline_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselinePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselinePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselinePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselinePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselinePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselinePolicyHandler.handleAfterDelete(Trigger.old);
    }
}
