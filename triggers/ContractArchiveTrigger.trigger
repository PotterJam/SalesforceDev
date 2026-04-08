trigger ContractArchiveTrigger on Contract_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
