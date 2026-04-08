trigger FloorTransactionTrigger on Floor_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
