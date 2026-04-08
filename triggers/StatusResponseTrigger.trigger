trigger StatusResponseTrigger on Status_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusResponseHandler.handleAfterDelete(Trigger.old);
    }
}
