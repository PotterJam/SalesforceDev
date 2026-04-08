trigger FinanceConfigTrigger on Finance_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceConfigHandler.handleAfterDelete(Trigger.old);
    }
}
