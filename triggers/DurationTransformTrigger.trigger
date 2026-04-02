trigger DurationTransformTrigger on Duration_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationTransformHandler.handleAfterDelete(Trigger.old);
    }
}
