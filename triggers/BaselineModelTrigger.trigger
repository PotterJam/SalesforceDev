trigger BaselineModelTrigger on Baseline_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineModelHandler.handleAfterDelete(Trigger.old);
    }
}
