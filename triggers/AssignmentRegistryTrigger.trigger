trigger AssignmentRegistryTrigger on Assignment_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
