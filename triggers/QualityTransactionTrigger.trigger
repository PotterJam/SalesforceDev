trigger QualityTransactionTrigger on Quality_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
