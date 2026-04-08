trigger ContractNodeTrigger on Contract_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractNodeHandler.handleAfterDelete(Trigger.old);
    }
}
