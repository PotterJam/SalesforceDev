trigger CapacityEntryTrigger on Capacity_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityEntryHandler.handleAfterDelete(Trigger.old);
    }
}
