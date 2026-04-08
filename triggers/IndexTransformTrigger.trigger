trigger IndexTransformTrigger on Index_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexTransformHandler.handleAfterDelete(Trigger.old);
    }
}
