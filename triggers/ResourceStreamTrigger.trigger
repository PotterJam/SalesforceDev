trigger ResourceStreamTrigger on Resource_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceStreamHandler.handleAfterDelete(Trigger.old);
    }
}
