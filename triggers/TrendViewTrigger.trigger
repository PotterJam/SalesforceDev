trigger TrendViewTrigger on Trend_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendViewHandler.handleAfterDelete(Trigger.old);
    }
}
