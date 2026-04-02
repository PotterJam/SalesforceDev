trigger ContractBindingTrigger on Contract_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractBindingHandler.handleAfterDelete(Trigger.old);
    }
}
