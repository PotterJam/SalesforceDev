trigger TrendStreamTrigger on Trend_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendStreamHandler.handleAfterDelete(Trigger.old);
    }
}
