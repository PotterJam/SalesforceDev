trigger ContractControllerTrigger on Contract_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractControllerHandler.handleAfterDelete(Trigger.old);
    }
}
