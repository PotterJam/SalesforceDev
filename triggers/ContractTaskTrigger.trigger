trigger ContractTaskTrigger on Contract_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractTaskHandler.handleAfterDelete(Trigger.old);
    }
}
