trigger TrendNodeTrigger on Trend_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendNodeHandler.handleAfterDelete(Trigger.old);
    }
}
