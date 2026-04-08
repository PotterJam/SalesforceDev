trigger FinanceHubTrigger on Finance_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceHubHandler.handleAfterDelete(Trigger.old);
    }
}
