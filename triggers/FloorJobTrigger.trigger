trigger FloorJobTrigger on Floor_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorJobHandler.handleAfterDelete(Trigger.old);
    }
}
