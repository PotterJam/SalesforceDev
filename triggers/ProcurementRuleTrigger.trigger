trigger ProcurementRuleTrigger on Procurement_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementRuleHandler.handleAfterDelete(Trigger.old);
    }
}
