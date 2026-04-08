trigger VarianceJobTrigger on Variance_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceJobHandler.handleAfterDelete(Trigger.old);
    }
}
