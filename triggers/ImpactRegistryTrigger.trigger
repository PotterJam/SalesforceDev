trigger ImpactRegistryTrigger on Impact_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
