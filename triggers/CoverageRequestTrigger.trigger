trigger CoverageRequestTrigger on Coverage_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageRequestHandler.handleAfterDelete(Trigger.old);
    }
}
