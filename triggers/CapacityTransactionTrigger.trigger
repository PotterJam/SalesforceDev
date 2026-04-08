trigger CapacityTransactionTrigger on Capacity_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
