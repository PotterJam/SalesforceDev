trigger AnalyticsBindingTrigger on Analytics_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsBindingHandler.handleAfterDelete(Trigger.old);
    }
}
