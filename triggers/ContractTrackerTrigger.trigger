trigger ContractTrackerTrigger on Contract_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
