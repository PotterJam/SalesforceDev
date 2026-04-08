trigger RatioRouteTrigger on Ratio_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioRouteHandler.handleAfterDelete(Trigger.old);
    }
}
