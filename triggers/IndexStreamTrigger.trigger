trigger IndexStreamTrigger on Index_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexStreamHandler.handleAfterDelete(Trigger.old);
    }
}
