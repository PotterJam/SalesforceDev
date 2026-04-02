trigger ReportEndpointTrigger on Report_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
