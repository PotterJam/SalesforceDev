trigger UtilizationRouteTrigger on Utilization_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRouteHandler.handleAfterDelete(Trigger.old);
    }
}
