trigger AnalyticsItemTrigger on Analytics_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsItemHandler.handleAfterDelete(Trigger.old);
    }
}
