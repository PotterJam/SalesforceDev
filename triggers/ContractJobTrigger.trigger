trigger ContractJobTrigger on Contract_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractJobHandler.handleAfterDelete(Trigger.old);
    }
}
