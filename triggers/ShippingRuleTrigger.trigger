trigger ShippingRuleTrigger on Shipping_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingRuleHandler.handleAfterDelete(Trigger.old);
    }
}
