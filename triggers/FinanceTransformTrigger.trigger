trigger FinanceTransformTrigger on Finance_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceTransformHandler.handleAfterDelete(Trigger.old);
    }
}
