trigger ContractAdapterTrigger on Contract_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
