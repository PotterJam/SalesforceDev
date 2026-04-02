trigger ContractStageTrigger on Contract_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractStageHandler.handleAfterDelete(Trigger.old);
    }
}
