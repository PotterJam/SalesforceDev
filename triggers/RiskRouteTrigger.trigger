trigger RiskRouteTrigger on Risk_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRouteHandler.handleAfterDelete(Trigger.old);
    }
}
