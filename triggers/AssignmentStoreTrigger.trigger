trigger AssignmentStoreTrigger on Assignment_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentStoreHandler.handleAfterDelete(Trigger.old);
    }
}
