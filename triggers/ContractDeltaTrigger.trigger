trigger ContractDeltaTrigger on Contract_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
