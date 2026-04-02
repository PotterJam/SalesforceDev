trigger ContractPolicyTrigger on Contract_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
