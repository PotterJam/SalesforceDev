trigger ScoreRouteTrigger on Score_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRouteHandler.handleAfterDelete(Trigger.old);
    }
}
