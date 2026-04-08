trigger ShippingPreferenceTrigger on Shipping_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
