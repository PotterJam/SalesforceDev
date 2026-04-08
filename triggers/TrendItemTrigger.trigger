trigger TrendItemTrigger on Trend_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendItemHandler.handleAfterDelete(Trigger.old);
    }
}
