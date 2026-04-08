trigger RiskPolicyTrigger on Risk_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
