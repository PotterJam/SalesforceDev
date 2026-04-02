trigger CustomerResponseTrigger on Customer_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerResponseHandler.handleAfterDelete(Trigger.old);
    }
}
