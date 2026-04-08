trigger VarianceStoreTrigger on Variance_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceStoreHandler.handleAfterDelete(Trigger.old);
    }
}
