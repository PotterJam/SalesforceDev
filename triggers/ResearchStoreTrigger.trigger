trigger ResearchStoreTrigger on Research_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchStoreHandler.handleAfterDelete(Trigger.old);
    }
}
