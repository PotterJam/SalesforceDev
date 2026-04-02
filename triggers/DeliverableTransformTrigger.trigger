trigger DeliverableTransformTrigger on Deliverable_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTransformHandler.handleAfterDelete(Trigger.old);
    }
}
