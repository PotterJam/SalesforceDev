trigger TargetTransactionTrigger on Target_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
