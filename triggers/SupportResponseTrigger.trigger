trigger SupportResponseTrigger on Support_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportResponseHandler.handleAfterDelete(Trigger.old);
    }
}
