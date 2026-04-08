trigger ProjectTransformTrigger on Project_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectTransformHandler.handleAfterDelete(Trigger.old);
    }
}
