trigger VarianceStreamTrigger on Variance_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceStreamHandler.handleAfterDelete(Trigger.old);
    }
}
