trigger AlertRegistryTrigger on Alert_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
