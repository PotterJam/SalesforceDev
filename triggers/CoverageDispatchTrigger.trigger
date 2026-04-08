trigger CoverageDispatchTrigger on Coverage_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
