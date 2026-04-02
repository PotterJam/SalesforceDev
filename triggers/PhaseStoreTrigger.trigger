trigger PhaseStoreTrigger on Phase_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseStoreHandler.handleAfterDelete(Trigger.old);
    }
}
