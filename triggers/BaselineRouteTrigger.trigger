trigger BaselineRouteTrigger on Baseline_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRouteHandler.handleAfterDelete(Trigger.old);
    }
}
