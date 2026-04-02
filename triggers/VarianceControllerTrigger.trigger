trigger VarianceControllerTrigger on Variance_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceControllerHandler.handleAfterDelete(Trigger.old);
    }
}
