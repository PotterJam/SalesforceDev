trigger FloorTriggerTrigger on Floor_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
