trigger ResearchRouteTrigger on Research_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRouteHandler.handleAfterDelete(Trigger.old);
    }
}
