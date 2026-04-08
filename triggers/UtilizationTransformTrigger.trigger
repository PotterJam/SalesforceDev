trigger UtilizationTransformTrigger on Utilization_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationTransformHandler.handleAfterDelete(Trigger.old);
    }
}
