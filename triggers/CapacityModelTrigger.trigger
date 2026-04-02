trigger CapacityModelTrigger on Capacity_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityModelHandler.handleAfterDelete(Trigger.old);
    }
}
