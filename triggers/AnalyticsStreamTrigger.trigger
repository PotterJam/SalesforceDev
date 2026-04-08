trigger AnalyticsStreamTrigger on Analytics_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsStreamHandler.handleAfterDelete(Trigger.old);
    }
}
