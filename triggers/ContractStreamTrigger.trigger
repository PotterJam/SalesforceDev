trigger ContractStreamTrigger on Contract_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractStreamHandler.handleAfterDelete(Trigger.old);
    }
}
