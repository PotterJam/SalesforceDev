trigger FloorLogTrigger on Floor_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorLogHandler.handleAfterDelete(Trigger.old);
    }
}
