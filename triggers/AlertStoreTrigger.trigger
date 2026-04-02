trigger AlertStoreTrigger on Alert_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertStoreHandler.handleAfterDelete(Trigger.old);
    }
}
