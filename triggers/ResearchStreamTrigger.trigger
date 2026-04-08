trigger ResearchStreamTrigger on Research_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchStreamHandler.handleAfterDelete(Trigger.old);
    }
}
