trigger AnalyticsFlowTrigger on Analytics_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsFlowHandler.handleAfterDelete(Trigger.old);
    }
}
