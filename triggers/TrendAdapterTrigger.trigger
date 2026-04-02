trigger TrendAdapterTrigger on Trend_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
