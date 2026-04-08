trigger DiscountPolicyTrigger on Discount_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
