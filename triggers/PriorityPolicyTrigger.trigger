trigger PriorityPolicyTrigger on Priority_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
