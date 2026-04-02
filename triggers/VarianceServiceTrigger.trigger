trigger VarianceServiceTrigger on Variance_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceServiceHandler.handleAfterDelete(Trigger.old);
    }
}
