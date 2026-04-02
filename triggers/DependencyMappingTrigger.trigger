trigger DependencyMappingTrigger on Dependency_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyMappingHandler.handleAfterDelete(Trigger.old);
    }
}
