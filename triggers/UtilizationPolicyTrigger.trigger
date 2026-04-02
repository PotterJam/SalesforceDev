trigger UtilizationPolicyTrigger on Utilization_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
