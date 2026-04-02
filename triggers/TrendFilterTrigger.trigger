trigger TrendFilterTrigger on Trend_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendFilterHandler.handleAfterDelete(Trigger.old);
    }
}
