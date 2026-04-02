trigger DiscountSettingTrigger on Discount_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountSettingHandler.handleAfterDelete(Trigger.old);
    }
}
