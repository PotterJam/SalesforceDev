trigger CustomerTransformTrigger on Customer_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerTransformHandler.handleAfterDelete(Trigger.old);
    }
}
