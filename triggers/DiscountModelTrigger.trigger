trigger DiscountModelTrigger on Discount_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountModelHandler.handleAfterDelete(Trigger.old);
    }
}
