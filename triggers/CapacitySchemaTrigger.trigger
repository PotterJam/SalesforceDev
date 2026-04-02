trigger CapacitySchemaTrigger on Capacity_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacitySchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacitySchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySchemaHandler.handleAfterDelete(Trigger.old);
    }
}
