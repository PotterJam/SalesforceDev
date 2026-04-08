trigger FinanceServiceTrigger on Finance_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceServiceHandler.handleAfterDelete(Trigger.old);
    }
}
