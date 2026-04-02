trigger BudgetMappingTrigger on Budget_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetMappingHandler.handleAfterDelete(Trigger.old);
    }
}
