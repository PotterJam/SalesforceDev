trigger ReviewTransformTrigger on Review_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewTransformHandler.handleAfterDelete(Trigger.old);
    }
}
