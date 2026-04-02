trigger ReportRouteTrigger on Report_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportRouteHandler.handleAfterDelete(Trigger.old);
    }
}
