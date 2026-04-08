trigger OrderPolicyTrigger on Order_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
