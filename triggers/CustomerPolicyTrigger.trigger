trigger CustomerPolicyTrigger on Customer_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
