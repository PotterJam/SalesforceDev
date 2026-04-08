trigger CapacityRecordTrigger on Capacity_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityRecordHandler.handleAfterDelete(Trigger.old);
    }
}
