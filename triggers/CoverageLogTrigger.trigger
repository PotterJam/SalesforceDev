trigger CoverageLogTrigger on Coverage_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageLogHandler.handleAfterDelete(Trigger.old);
    }
}
