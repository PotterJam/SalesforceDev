trigger TrendEventTrigger on Trend_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendEventHandler.handleAfterDelete(Trigger.old);
    }
}
