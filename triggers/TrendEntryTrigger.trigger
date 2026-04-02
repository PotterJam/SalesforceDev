trigger TrendEntryTrigger on Trend_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendEntryHandler.handleAfterDelete(Trigger.old);
    }
}
