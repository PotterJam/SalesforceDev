trigger VarianceResponseTrigger on Variance_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceResponseHandler.handleAfterDelete(Trigger.old);
    }
}
