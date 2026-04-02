trigger VarianceDetailTrigger on Variance_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceDetailHandler.handleAfterDelete(Trigger.old);
    }
}
