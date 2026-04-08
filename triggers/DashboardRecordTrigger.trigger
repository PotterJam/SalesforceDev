trigger DashboardRecordTrigger on Dashboard_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRecordHandler.handleAfterDelete(Trigger.old);
    }
}
