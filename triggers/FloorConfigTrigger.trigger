trigger FloorConfigTrigger on Floor_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorConfigHandler.handleAfterDelete(Trigger.old);
    }
}
