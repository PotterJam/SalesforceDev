trigger ReportQueueTrigger on Report_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportQueueHandler.handleAfterDelete(Trigger.old);
    }
}
