trigger DiscountPreferenceTrigger on Discount_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
