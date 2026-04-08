trigger SupportTransformTrigger on Support_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTransformHandler.handleAfterDelete(Trigger.old);
    }
}
