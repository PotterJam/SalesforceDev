trigger RiskBindingTrigger on Risk_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskBindingHandler.handleAfterDelete(Trigger.old);
    }
}
