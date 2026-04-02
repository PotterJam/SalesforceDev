trigger AlertSummaryTrigger on Alert_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
