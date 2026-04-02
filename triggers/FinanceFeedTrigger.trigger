trigger FinanceFeedTrigger on Finance_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceFeedHandler.handleAfterDelete(Trigger.old);
    }
}
