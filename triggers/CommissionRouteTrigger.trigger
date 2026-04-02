trigger CommissionRouteTrigger on Commission_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRouteHandler.handleAfterDelete(Trigger.old);
    }
}
