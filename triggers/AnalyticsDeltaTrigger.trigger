trigger AnalyticsDeltaTrigger on Analytics_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
