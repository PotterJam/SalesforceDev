trigger ResolutionStreamTrigger on Resolution_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionStreamHandler.handleAfterDelete(Trigger.old);
    }
}
