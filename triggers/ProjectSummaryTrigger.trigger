trigger ProjectSummaryTrigger on Project_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
