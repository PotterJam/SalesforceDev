trigger FloorServiceTrigger on Floor_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorServiceHandler.handleAfterDelete(Trigger.old);
    }
}
