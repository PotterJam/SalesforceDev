trigger AlertTransformTrigger on Alert_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTransformHandler.handleAfterDelete(Trigger.old);
    }
}
