trigger PartnerRouteTrigger on Partner_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerRouteHandler.handleAfterDelete(Trigger.old);
    }
}
