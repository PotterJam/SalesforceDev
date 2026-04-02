trigger VarianceDeltaTrigger on Variance_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
