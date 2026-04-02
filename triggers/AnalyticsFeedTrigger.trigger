trigger AnalyticsFeedTrigger on Analytics_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsFeedHandler.handleAfterDelete(Trigger.old);
    }
}
