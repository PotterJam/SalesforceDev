trigger ResolutionStoreTrigger on Resolution_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionStoreHandler.handleAfterDelete(Trigger.old);
    }
}
