trigger BaselineTransformTrigger on Baseline_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineTransformHandler.handleAfterDelete(Trigger.old);
    }
}
