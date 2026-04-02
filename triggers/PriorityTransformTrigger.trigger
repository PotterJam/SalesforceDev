trigger PriorityTransformTrigger on Priority_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityTransformHandler.handleAfterDelete(Trigger.old);
    }
}
