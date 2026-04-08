trigger CoverageResponseTrigger on Coverage_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageResponseHandler.handleAfterDelete(Trigger.old);
    }
}
