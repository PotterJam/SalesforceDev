trigger TargetRouteTrigger on Target_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRouteHandler.handleAfterDelete(Trigger.old);
    }
}
