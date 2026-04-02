trigger CeilingStreamTrigger on Ceiling_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingStreamHandler.handleAfterDelete(Trigger.old);
    }
}
