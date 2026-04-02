trigger ContractEntryTrigger on Contract_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractEntryHandler.handleAfterDelete(Trigger.old);
    }
}
