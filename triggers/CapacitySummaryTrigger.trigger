trigger CapacitySummaryTrigger on Capacity_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacitySummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacitySummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySummaryHandler.handleAfterDelete(Trigger.old);
    }
}
