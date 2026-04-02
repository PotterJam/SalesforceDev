trigger ContractPluginTrigger on Contract_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractPluginHandler.handleAfterDelete(Trigger.old);
    }
}
