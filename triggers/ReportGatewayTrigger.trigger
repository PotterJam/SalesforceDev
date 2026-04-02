trigger ReportGatewayTrigger on Report_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
