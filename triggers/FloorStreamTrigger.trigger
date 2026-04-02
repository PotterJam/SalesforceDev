trigger FloorStreamTrigger on Floor_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorStreamHandler.handleAfterDelete(Trigger.old);
    }
}
