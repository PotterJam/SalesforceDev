trigger DiscountModuleTrigger on Discount_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountModuleHandler.handleAfterDelete(Trigger.old);
    }
}
