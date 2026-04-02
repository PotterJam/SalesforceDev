trigger ContractRelayTrigger on Contract_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRelayHandler.handleAfterDelete(Trigger.old);
    }
}
