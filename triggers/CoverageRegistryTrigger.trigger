trigger CoverageRegistryTrigger on Coverage_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
