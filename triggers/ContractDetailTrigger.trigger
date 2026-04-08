trigger ContractDetailTrigger on Contract_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractDetailHandler.handleAfterDelete(Trigger.old);
    }
}
