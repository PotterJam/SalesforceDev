trigger DeliverableTransactionTrigger on Deliverable_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
