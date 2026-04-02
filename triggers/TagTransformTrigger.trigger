trigger TagTransformTrigger on Tag_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTransformHandler.handleAfterDelete(Trigger.old);
    }
}
