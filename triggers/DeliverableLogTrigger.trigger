trigger DeliverableLogTrigger on Deliverable_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableLogHandler.handleAfterDelete(Trigger.old);
    }
}
