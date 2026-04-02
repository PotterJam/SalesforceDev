trigger LabelSummaryTrigger on Label_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
