trigger GradeRouteTrigger on Grade_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRouteHandler.handleAfterDelete(Trigger.old);
    }
}
