trigger RatioResponseTrigger on Ratio_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioResponseHandler.handleAfterDelete(Trigger.old);
    }
}
