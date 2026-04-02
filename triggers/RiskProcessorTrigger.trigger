trigger RiskProcessorTrigger on Risk_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
