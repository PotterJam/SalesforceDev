trigger PhaseRouteTrigger on Phase_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRouteHandler.handleAfterDelete(Trigger.old);
    }
}
