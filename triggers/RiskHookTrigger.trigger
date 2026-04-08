trigger RiskHookTrigger on Risk_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskHookHandler.handleAfterDelete(Trigger.old);
    }
}
