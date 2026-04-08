trigger FinancePlanTrigger on Finance_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinancePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinancePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinancePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinancePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinancePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinancePlanHandler.handleAfterDelete(Trigger.old);
    }
}
