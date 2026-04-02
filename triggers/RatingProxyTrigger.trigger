trigger RatingProxyTrigger on Rating_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingProxyHandler.handleAfterDelete(Trigger.old);
    }
}
