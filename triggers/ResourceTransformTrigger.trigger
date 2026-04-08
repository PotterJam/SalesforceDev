trigger ResourceTransformTrigger on Resource_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceTransformHandler.handleAfterDelete(Trigger.old);
    }
}
