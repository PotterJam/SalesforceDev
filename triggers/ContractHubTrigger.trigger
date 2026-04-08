trigger ContractHubTrigger on Contract_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractHubHandler.handleAfterDelete(Trigger.old);
    }
}
