trigger LabelRouteTrigger on Label_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelRouteHandler.handleAfterDelete(Trigger.old);
    }
}
