trigger DiscountFlowTrigger on Discount_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountFlowHandler.handleAfterDelete(Trigger.old);
    }
}
