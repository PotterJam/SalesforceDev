trigger QualityRouteTrigger on Quality_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRouteHandler.handleAfterDelete(Trigger.old);
    }
}
