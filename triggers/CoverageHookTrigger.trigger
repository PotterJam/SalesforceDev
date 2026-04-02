trigger CoverageHookTrigger on Coverage_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageHookHandler.handleAfterDelete(Trigger.old);
    }
}
