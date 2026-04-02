trigger CoverageHandlerTrigger on Coverage_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
