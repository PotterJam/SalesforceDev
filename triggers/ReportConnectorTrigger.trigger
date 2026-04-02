trigger ReportConnectorTrigger on Report_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
