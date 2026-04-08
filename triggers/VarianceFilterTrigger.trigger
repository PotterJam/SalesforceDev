trigger VarianceFilterTrigger on Variance_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceFilterHandler.handleAfterDelete(Trigger.old);
    }
}
