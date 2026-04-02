trigger ReportRelayTrigger on Report_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportRelayHandler.handleAfterDelete(Trigger.old);
    }
}
