trigger ContractRecordTrigger on Contract_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRecordHandler.handleAfterDelete(Trigger.old);
    }
}
