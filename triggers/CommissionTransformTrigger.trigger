trigger CommissionTransformTrigger on Commission_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionTransformHandler.handleAfterDelete(Trigger.old);
    }
}
