trigger CapacityProcessorTrigger on Capacity_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
