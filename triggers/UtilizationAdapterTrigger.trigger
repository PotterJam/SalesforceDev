trigger UtilizationAdapterTrigger on Utilization_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
