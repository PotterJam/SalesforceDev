trigger RiskHandlerTrigger on Risk_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
