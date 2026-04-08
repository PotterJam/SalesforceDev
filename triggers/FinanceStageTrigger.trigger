trigger FinanceStageTrigger on Finance_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceStageHandler.handleAfterDelete(Trigger.old);
    }
}
