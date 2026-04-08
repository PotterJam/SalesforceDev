trigger TargetTransformTrigger on Target_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTransformHandler.handleAfterDelete(Trigger.old);
    }
}
