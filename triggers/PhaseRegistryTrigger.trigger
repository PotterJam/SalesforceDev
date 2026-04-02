trigger PhaseRegistryTrigger on Phase_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
