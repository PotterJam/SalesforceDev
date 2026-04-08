trigger TagRequestTrigger on Tag_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRequestHandler.handleAfterDelete(Trigger.old);
    }
}
