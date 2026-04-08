trigger VarianceModelTrigger on Variance_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceModelHandler.handleAfterDelete(Trigger.old);
    }
}
