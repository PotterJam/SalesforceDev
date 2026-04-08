trigger UtilizationModelTrigger on Utilization_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationModelHandler.handleAfterDelete(Trigger.old);
    }
}
