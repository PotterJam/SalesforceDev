trigger TrendBindingTrigger on Trend_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendBindingHandler.handleAfterDelete(Trigger.old);
    }
}
