trigger ImpactRouteTrigger on Impact_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRouteHandler.handleAfterDelete(Trigger.old);
    }
}
