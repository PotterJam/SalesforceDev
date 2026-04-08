trigger ProductResponseTrigger on Product_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductResponseHandler.handleAfterDelete(Trigger.old);
    }
}
