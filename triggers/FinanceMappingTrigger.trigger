trigger FinanceMappingTrigger on Finance_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceMappingHandler.handleAfterDelete(Trigger.old);
    }
}
