trigger CapacityPolicyTrigger on Capacity_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
