trigger TargetRegistryTrigger on Target_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
