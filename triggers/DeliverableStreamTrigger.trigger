trigger DeliverableStreamTrigger on Deliverable_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableStreamHandler.handleAfterDelete(Trigger.old);
    }
}
