trigger CoverageEntryTrigger on Coverage_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageEntryHandler.handleAfterDelete(Trigger.old);
    }
}
