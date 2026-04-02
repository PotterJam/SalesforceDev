trigger TrendActionTrigger on Trend_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendActionHandler.handleAfterDelete(Trigger.old);
    }
}
