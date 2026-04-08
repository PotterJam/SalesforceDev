trigger CeilingResponseTrigger on Ceiling_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingResponseHandler.handleAfterDelete(Trigger.old);
    }
}
