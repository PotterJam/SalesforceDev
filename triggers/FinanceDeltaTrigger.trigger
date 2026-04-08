trigger FinanceDeltaTrigger on Finance_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
