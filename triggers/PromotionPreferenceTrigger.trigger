trigger PromotionPreferenceTrigger on Promotion_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
