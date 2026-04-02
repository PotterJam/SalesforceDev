trigger TagRegistryTrigger on Tag_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
