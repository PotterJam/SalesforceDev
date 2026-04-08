trigger VarianceBindingTrigger on Variance_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceBindingHandler.handleAfterDelete(Trigger.old);
    }
}
