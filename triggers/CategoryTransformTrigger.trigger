trigger CategoryTransformTrigger on Category_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTransformHandler.handleAfterDelete(Trigger.old);
    }
}
