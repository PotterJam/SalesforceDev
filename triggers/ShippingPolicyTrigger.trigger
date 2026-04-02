trigger ShippingPolicyTrigger on Shipping_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
