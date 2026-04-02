trigger FloorDispatchTrigger on Floor_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
