trigger CommissionPolicyTrigger on Commission_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
